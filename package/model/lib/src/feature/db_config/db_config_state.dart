import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'db_config.dart';
import 'db_config_repository.dart';

part 'db_config_state.g.dart';

@riverpod
Future<DbConfig> dbConfig(DbConfigRef ref) async {
  final now = DateTime.now();
  return ref.watch(dbConfigRepositoryProvider).fetchDbConfig(now);
}
