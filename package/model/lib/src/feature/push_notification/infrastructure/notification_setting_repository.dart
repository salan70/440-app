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

  Future<NotificationSetting> fetch() async =>
      box.get(NotificationSetting.defaultId) ?? NotificationSetting.initial();

  Future<void> save(NotificationSetting notificationSetting) async =>
      box.put(notificationSetting);
}
