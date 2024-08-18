import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version/version.dart';

part 'db_config.freezed.dart';

@freezed
class DbConfig with _$DbConfig {
  const factory DbConfig({
    /// 配信中の DB のバージョン。
    required Version dbVersion,

    // TODO(me): このフィールド削除する。
    /// 選手情報の DB の URL.
    required String playersDbUrl,

    // TODO(me): このフィールド削除する。
    /// 打撃成績の DB の URL.
    required String battingStatsDbUrl,
  }) = _DbConfig;
  const DbConfig._();

  /// Firestore から取得したデータを [DbConfig] に変換する。
  factory DbConfig.fromFirestore(Map<String, dynamic> json) {
    return DbConfig(
      dbVersion: Version.parse(json['version'] as String),
      playersDbUrl: json['playersDbUrl'] as String,
      battingStatsDbUrl: json['battingStatsDbUrl'] as String,
    );
  }
}
