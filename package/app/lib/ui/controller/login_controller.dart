import 'dart:io';

import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:version/version.dart';

import '../../core/util/controller_mixin.dart';

part 'login_controller.g.dart';

@riverpod
LoginController loginController(
  LoginControllerRef ref,
) =>
    LoginController(ref);

class LoginController with ControllerMixin {
  LoginController(this._ref);

  final Ref _ref;

  /// ログインを行う（アプリ起動時に呼ぶ）。
  ///
  /// 現在のユーザーを取得し、 null だったら匿名ユーザーを作成する。
  Future<void> login() async {
    await _maybeSignInAnonymously();

    // 現在のユーザーを取得し、ログ出力する。
    final currentUser = _ref.read(authRepositoryProvider).getCurrentUser()!;
    logger.i('ログインしました。uid: ${currentUser.uid}');

    await _createOrUpdateUserInfo();
    await _maybeCreateReviewHistory(currentUser);

    // * DB 関連の処理。
    await initializeDatabase();
    final appDbRepository = _ref.read(appDbRepositoryProvider);
    await appDbRepository.ping();
  }

  /// 未ログインの場合、匿名ユーザーとしてログインする。
  /// （匿名ユーザーを作成する。）
  Future<void> _maybeSignInAnonymously() async {
    final authRepository = _ref.read(authRepositoryProvider);
    final currentUser = authRepository.getCurrentUser();

    // ログイン済みでない場合、匿名ユーザーを作成する。
    if (currentUser == null) {
      logger.i('ログインしていないため、匿名ユーザーを作成します。');
      await authRepository.signInAnonymously();
    }
  }

  Future<void> _maybeCreateReviewHistory(firebase_auth.User user) async {
    final reviewHistory = await _ref.read(reviewHistoryProvider.future);
    if (reviewHistory == null) {
      await _ref.read(reviewHistoryRepositoryProvider).create(user.uid);
    }
  }

  /// userInfo ドキュメントが存在しない場合は新規作成し、存在する場合は更新する。
  Future<void> _createOrUpdateUserInfo() async {
    final currentUserInfo = await _ref.read(currentUserInfoProvider.future);
    final appVersion = await _ref.read(currentAppVersionProvider.future);
    final dbConfig = await _ref.read(dbConfigProvider.future);
    final dbVersion = dbConfig.dbVersion;

    // * userInfo ドキュメントが存在しない場合
    if (currentUserInfo == null) {
      // TODO(me): DB をダウンロードし、ダウンロードが成功したらドキュメントの値を更新する。
      // ダウンロードが失敗したら、リトライさせるか、無視して dbVersion を更新しないかのどっちかで悩んでいる。
      await _createUserInfo(appVersion, dbVersion);
      return;
    }

    // * userInfo ドキュメントが存在する場合
    if (currentUserInfo.dbVersion != dbConfig.dbVersion) {
      // TODO(me): DB をダウンロードし、ダウンロードが成功したらドキュメントの値を更新する。
      // ダウンロードが失敗したら、リトライさせるか、無視して dbVersion を更新しないかのどっちかで悩んでいる。
    }

    await _updateUserInfo(currentUserInfo, appVersion, dbVersion);
  }

  /// userInfo ドキュメントを新規作成する。
  Future<void> _createUserInfo(Version appVersion, Version dbVersion) async {
    final currentUser = _ref.read(authRepositoryProvider).getCurrentUser()!;
    final userInfo = UserInfo(
      userId: currentUser.uid,
      appVersion: appVersion,
      dbVersion: dbVersion,
      createdAt: currentUser.metadata.creationTime!,
    );

    await _ref.read(userInfoRepositoryProvider).createUserInfo(userInfo);
  }

  /// userInfo ドキュメントを更新する。
  Future<void> _updateUserInfo(
    UserInfo currentUserInfo,
    Version appVersion,
    Version dbVersion,
  ) async {
    final newUserInfo = currentUserInfo.copyWith(
      appVersion: appVersion,
      dbVersion: dbVersion,
    );

    await _ref.read(userInfoRepositoryProvider).updateUserInfo(newUserInfo);
  }

  Future<void> initializeDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dbFolder.path, 'app.db');
    final dbFile = File(dbPath);

    // if (!dbFile.existsSync()) {
    await _downloadAndCreateDatabase(dbFile);
    // }

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
  }

  Future<void> _downloadAndCreateDatabase(File dbFile) async {
    final dbConfig = await _ref.read(dbConfigProvider.future);
    final dbVersion = dbConfig.dbVersion;
    final dbVersionStr = dbVersion.toString();

    final baseballStatsBytes = await _ref
        .read(dbFileRepositoryProvider)
        .downloadBaseballStatsDb(dbVersionStr);

    if (baseballStatsBytes != null) {
      await dbFile.writeAsBytes(baseballStatsBytes);
      return;
    }
  }
}
