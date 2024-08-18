import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version/version.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    /// ユーザー ID.
    required String userId,

    /// 現在のアプリバージョン。
    required Version appVersion,

    /// 現在の DB のバージョン。
    required Version dbVersion,

    /// ユーザーが作成された日時。
    required DateTime createdAt,
  }) = _UserInfo;

  /// Firestore から取得したドキュメントを [UserInfo] に変換する。
  factory UserInfo.fromFirestore(Map<String, dynamic> json, String userId) {
    return UserInfo(
      userId: userId,
      appVersion: json['appVersion'] != null
          ? Version.parse(json['appVersion'] as String)
          : _defaultAppVersion,
      dbVersion: json['dbVersion'] != null
          ? Version.parse(json['dbVersion'] as String)
          : _defaultDbVersion,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
  const UserInfo._();

  static final _defaultAppVersion = Version(1, 0, 0);
  static final _defaultDbVersion = Version(1, 0, 0);

  /// Firestore のドキュメントを更新するためのデータに変換する。
  Map<String, dynamic> toFirestoreUpdate() {
    return <String, dynamic>{
      'appVersion': appVersion.toString(),
      'dbVersion': dbVersion.toString(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
