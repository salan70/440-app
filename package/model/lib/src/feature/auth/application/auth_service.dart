import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

import '../../app_info/application/app_info_state.dart';
import '../../app_review/application/app_review_state.dart';
import '../../app_review/infrastructure/review_history_repository.dart';
import '../../db_config/db_config_state.dart';
import '../../user_info/user_info.dart';
import '../../user_info/user_info_repository.dart';
import '../../user_info/user_info_state.dart';
import '../infrastructure/auth_repository.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) => AuthService(ref);

/// Auth 関連の処理を行うサービスクラス。
class AuthService {
  const AuthService(this.ref);

  final Ref ref;

  /// ログインを行う（アプリ起動時に呼ぶ）。
  ///
  /// 現在のユーザーを取得し、 null だったら匿名ユーザーを作成する。
  Future<void> login() async {
    await _maybeSignInAnonymously();

    // 現在のユーザーを取得し、ログ出力する。
    final currentUser = ref.read(authRepositoryProvider).getCurrentUser()!;
    logger.i('ログインしました。uid: ${currentUser.uid}');

    await _createOrUpdateUserInfo();
    await _maybeCreateReviewHistory(currentUser);
  }

  /// 未ログインの場合、匿名ユーザーとしてログインする。
  /// （匿名ユーザーを作成する。）
  Future<void> _maybeSignInAnonymously() async {
    final authRepository = ref.read(authRepositoryProvider);
    final currentUser = authRepository.getCurrentUser();

    // ログイン済みでない場合、匿名ユーザーを作成する。
    if (currentUser == null) {
      logger.i('ログインしていないため、匿名ユーザーを作成します。');
      await authRepository.signInAnonymously();
    }
  }

  Future<void> _maybeCreateReviewHistory(firebase_auth.User user) async {
    final reviewHistory = await ref.read(reviewHistoryProvider.future);
    if (reviewHistory == null) {
      await ref.read(reviewHistoryRepositoryProvider).create(user.uid);
    }
  }

  /// userInfo ドキュメントが存在しない場合は新規作成し、存在する場合は更新する。
  Future<void> _createOrUpdateUserInfo() async {
    final currentUserInfo = await ref.read(currentUserInfoProvider.future);
    final appVersion = await ref.read(currentAppVersionProvider.future);
    final dbConfig = await ref.read(dbConfigProvider.future);

    // * userInfo ドキュメントが存在しない場合
    if (currentUserInfo == null) {
      // TODO(me): DB をダウンロードし、ダウンロードが成功したらドキュメントの値を更新する。
      // ダウンロードが失敗したら、リトライさせるか、無視して dbVersion を更新しないかのどっちかで悩んでいる。
      await _createUserInfo(appVersion, dbConfig.dbVersion);
      return;
    }

    // * userInfo ドキュメントが存在する場合
    if (currentUserInfo.dbVersion != dbConfig.dbVersion) {
      // TODO(me): DB をダウンロードし、ダウンロードが成功したらドキュメントの値を更新する。
      // ダウンロードが失敗したら、リトライさせるか、無視して dbVersion を更新しないかのどっちかで悩んでいる。
    }

    await _updateUserInfo(currentUserInfo, appVersion, dbConfig.dbVersion);
  }

  /// userInfo ドキュメントを新規作成する。
  Future<void> _createUserInfo(Version appVersion, Version dbVersion) async {
    final currentUser = ref.read(authRepositoryProvider).getCurrentUser()!;
    final userInfo = UserInfo(
      userId: currentUser.uid,
      appVersion: appVersion,
      dbVersion: dbVersion,
      createdAt: currentUser.metadata.creationTime!,
    );

    await ref.read(userInfoRepositoryProvider).createUserInfo(userInfo);
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

    await ref.read(userInfoRepositoryProvider).updateUserInfo(newUserInfo);
  }
}
