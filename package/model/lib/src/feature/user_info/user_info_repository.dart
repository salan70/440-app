import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_info.dart';

part 'user_info_repository.g.dart';

@riverpod
UserInfoRepository userInfoRepository(UserInfoRepositoryRef ref) =>
    UserInfoRepository(FirebaseFirestore.instance);

class UserInfoRepository {
  UserInfoRepository(this.firestore);

  final FirebaseFirestore firestore;

  /// userInfo ドキュメントを取得する。
  ///
  /// 存在しない場合は例外を投げる。
  Future<UserInfo> fetchUserInfo(String userId) async {
    final snapshot = await firestore.collection('users').doc(userId).get();
    if (!snapshot.exists) {
      throw DatabaseException.notFound(DataSourceType.firestore);
    }
    return UserInfo.fromFirestore(snapshot.data()!, userId);
  }

  /// userInfo ドキュメントを更新する。
  Future<void> updateUserInfo(UserInfo userInfo) async {
    await firestore.collection('users').doc(userInfo.userId).update(
      <String, dynamic>{...userInfo.toFirestoreUpdate()},
    );
  }
}
