import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../db_config/db_config_state.dart';
import '../user_info/user_info_state.dart';

part 'app_db_state.g.dart';

/// ローカルDB の初期化が必要かどうかを返す。
@riverpod
Future<bool> needInitializeDb(NeedInitializeDbRef ref) async {
  final currentUserInfo = await ref.watch(currentUserInfoProvider.future);
  final dbConfig = await ref.watch(dbConfigProvider.future);
  final dbVersion = dbConfig.dbVersion;

  return currentUserInfo.dbVersion != dbVersion;
}
