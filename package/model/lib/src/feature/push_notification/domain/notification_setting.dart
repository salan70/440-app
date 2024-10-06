import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'notification_setting.freezed.dart';
part 'notification_setting.g.dart';

@freezed
class NotificationSetting with _$NotificationSetting {
  @Entity(realClass: NotificationSetting)
  const factory NotificationSetting({
    @Id(assignable: true) required int id,
    required bool allowStartDailyQuizNotification,
    required bool allowRemindDailyQuizNotification,
    required bool allowOtherNotification,
  }) = _NotificationSetting;

  /// ユーザーが未設定の場合の初期値
  factory NotificationSetting.initial() => const NotificationSetting(
        id: defaultId,
        allowStartDailyQuizNotification: true,
        allowRemindDailyQuizNotification: true,
        allowOtherNotification: true,
      );

  factory NotificationSetting.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingFromJson(json);

  @override
  Map<String, dynamic> toJson();

  static const defaultId = 1;
}
