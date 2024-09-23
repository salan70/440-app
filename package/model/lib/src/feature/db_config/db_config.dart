import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version/version.dart';

part 'db_config.freezed.dart';

@freezed
class DbConfig with _$DbConfig {
  const factory DbConfig({
    /// 配信中の DB のバージョン。
    required Version dbVersion,
  }) = _DbConfig;
  const DbConfig._();

  /// Firestore から取得したデータを [DbConfig] に変換する。
  factory DbConfig.fromFirestore(Map<String, dynamic> json) {
    return DbConfig(
      dbVersion: Version.parse(json['version'] as String),
    );
  }
}
