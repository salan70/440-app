import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_setting.freezed.dart';
part 'notification_setting.g.dart';

@freezed
class NotificationSetting with _$NotificationSetting {
  const factory NotificationSetting({
    required bool allowStartDailyQuizNotification,
    required bool allowRemindDailyQuizNotification,
    required bool allowOtherNotification,
  }) = _NotificationSetting;

  /// ユーザーが未設定の場合の初期値
  factory NotificationSetting.initial() => const NotificationSetting(
        allowStartDailyQuizNotification: true,
        allowRemindDailyQuizNotification: true,
        allowOtherNotification: true,
      );

  factory NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingFromJson(json);

  @override
  Map<String, dynamic> toJson();

  static const recordName = 'notification_settings';
}
