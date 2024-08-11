import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    // 未ログインの場合、匿名ユーザーとしてログインする。
    await _maybeSignInAnonymously();

    // 現在のユーザーを取得する。
    final currentUser = ref.read(authRepositoryProvider).getCurrentUser()!;
    logger.i('ログインしました。uid: ${currentUser.uid}');

    // userInfo を更新する。
    await _createOrUpdateUserInfo();

    // reviewHistory が存在しない場合、作成する。
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
    // userInfo ドキュメントを取得
    final currentUserInfo = await ref.read(currentUserInfoProvider.future);

    // アプリのバージョンを取得
    final appVersion = await ref.read(currentAppVersionProvider.future);

    // DB のバージョンを取得
    final dbConfig = await ref.read(dbConfigProvider.future);
    if (dbConfig.dbVersion != dbConfig.dbVersion) {
      // TODO(me): DB をダウンロードし、ダウンロードが成功したらドキュメントの値を更新する。
      // ダウンロードが失敗したら、リトライさせるか、無視して dbVersion を更新しないかのどっちかで悩んでいる。
    }

    // * userInfo ドキュメントが存在しない場合
    if (currentUserInfo == null) {
      final currentUser = ref.read(authRepositoryProvider).getCurrentUser()!;
      final userInfo = UserInfo(
        userId: currentUser.uid,
        appVersion: appVersion,
        dbVersion: dbConfig.dbVersion,
        createdAt: currentUser.metadata.creationTime!,
      );

      await ref.read(userInfoRepositoryProvider).createUserInfo(userInfo);
      return;
    }

    // * userInfo ドキュメントが存在する場合
    final userInfo = currentUserInfo.copyWith(
      appVersion: appVersion,
      dbVersion: dbConfig.dbVersion,
    );

    await ref.read(userInfoRepositoryProvider).updateUserInfo(userInfo);
  }
}
