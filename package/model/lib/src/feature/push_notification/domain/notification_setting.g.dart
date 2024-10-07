// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSettingImpl _$$NotificationSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingImpl(
      id: (json['id'] as num).toInt(),
      allowStartDailyQuizNotification:
          json['allowStartDailyQuizNotification'] as bool,
      allowRemindDailyQuizNotification:
          json['allowRemindDailyQuizNotification'] as bool,
      allowOtherNotification: json['allowOtherNotification'] as bool,
    );

Map<String, dynamic> _$$NotificationSettingImplToJson(
        _$NotificationSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'allowStartDailyQuizNotification':
          instance.allowStartDailyQuizNotification,
      'allowRemindDailyQuizNotification':
          instance.allowRemindDailyQuizNotification,
      'allowOtherNotification': instance.allowOtherNotification,
    };
