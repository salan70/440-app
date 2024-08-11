import 'package:cloud_firestore/cloud_firestore.dart';
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
  /// 存在しない場合は null を返す。
  Future<UserInfo?> fetchUserInfo(String userId) async {
    final snapshot = await firestore.collection('users').doc(userId).get();
    if (!snapshot.exists) {
      return null;
    }
    return UserInfo.fromFirestore(snapshot.data()!, userId);
  }

  /// userInfo ドキュメントを新規作成する。
  Future<void> createUserInfo(UserInfo userInfo) async {
    // ドキュメント ID を指定して新規作成するため、 `set()` を使う。 
    await firestore.collection('users').doc(userInfo.userId).set(
      <String, dynamic>{...userInfo.toFirestoreCreate()},
    );
  }

  /// userInfo ドキュメントを更新する。
  Future<void> updateUserInfo(UserInfo userInfo) async {
    await firestore.collection('users').doc(userInfo.userId).update(
      <String, dynamic>{...userInfo.toFirestoreUpdate()},
    );
  }
}
