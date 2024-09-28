import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'login_controller.g.dart';

@riverpod
LoginController loginController(LoginControllerRef ref) => LoginController(ref);

class LoginController {
  LoginController(this._ref);

  final Ref _ref;

  /// ログインを行う（アプリ起動時に呼ぶ）。
  ///
  /// 現在のユーザーを取得し、 null だったら匿名ユーザーを作成する。
  Future<void> login() async {
    await _maybeSignInAnonymously();
    _printCurrentUserId();

    await _updateUserInfo();

    // * DB 関連の処理。
    await _maybeInitializeDatabase();
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

  /// 現在のユーザーの ID をログ出力する。
  void _printCurrentUserId() {
    final currentUser = _ref.read(authRepositoryProvider).getCurrentUser()!;
    logger.i('現在のユーザーの ID は [${currentUser.uid}] です。');
  }

  /// userInfo ドキュメントを更新する。
  Future<void> _updateUserInfo() async {
    final currentUserInfo = await _ref.read(currentUserInfoProvider.future);
    final appVersion = await _ref.read(currentAppVersionProvider.future);
    final dbConfig = await _ref.read(dbConfigProvider.future);

    final newUserInfo = currentUserInfo.copyWith(
      appVersion: appVersion,
      dbVersion: dbConfig.dbVersion,
    );

    await _ref.read(userInfoRepositoryProvider).updateUserInfo(newUserInfo);
  }

  /// 必要に応じてデータベースの初期化を行う。
  Future<void> _maybeInitializeDatabase() async {
    final needInitializeDb = await _ref.read(needInitializeDbProvider.future);

    if (needInitializeDb) {
      logger.i('ローカルDB の初期化が必要です。初期化を行います。');
      // TODO(me): エラーハンドリング
      await _initializeDatabase();
      return;
    }
    logger.i('ローカルDB の初期化は不要です。');
  }

  /// データベースの初期化を行う。
  Future<void> _initializeDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dbFolder.path, 'app.db');
    final dbFile = File(dbPath);

    await _downloadAndCreateDatabase(dbFile);

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
  }

  Future<void> _downloadAndCreateDatabase(File dbFile) async {
    final dbConfig = await _ref.read(dbConfigProvider.future);
    final dbVersionStr = dbConfig.dbVersion.toString();

    final baseballStatsBytes = await _ref
        .read(dbFileRepositoryProvider)
        .downloadBaseballStatsDb(dbVersionStr);

    await dbFile.writeAsBytes(baseballStatsBytes);
    return;
  }
}
