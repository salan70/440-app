import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/notification_setting.dart';

part 'notification_setting_repository.g.dart';

@riverpod
NotificationSettingRepository notificationSettingRepository(
  NotificationSettingRepositoryRef ref,
) =>
    throw UnimplementedError();

class NotificationSettingRepository {
  NotificationSettingRepository(this.box);

  final Box<NotificationSetting> box;

  NotificationSetting fetch() =>
      box.get(NotificationSetting.defaultId) ?? NotificationSetting.initial();

  void save(NotificationSetting notificationSetting) =>
      box.put(notificationSetting);
}
