import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

import '../domain/notification_setting.dart';

part 'notification_setting_repository.g.dart';

@riverpod
NotificationSettingRepository notificationSettingRepository(
  NotificationSettingRepositoryRef ref,
) =>
    throw UnimplementedError();

class NotificationSettingRepository {
  NotificationSettingRepository(this.db);

  final Database db;
  final _store = StoreRef.main();

  Future<NotificationSetting> fetch() async {
    final record = await _store.record(NotificationSetting.recordName).get(db)
        as Map<String, dynamic>?;

    return record != null
        ? NotificationSetting.fromJson(record)
        : NotificationSetting.initial();
  }

  Future<void> save(NotificationSetting notificationSetting) async {
    await _store
        .record(NotificationSetting.recordName)
        .put(db, notificationSetting.toJson());
  }
}
