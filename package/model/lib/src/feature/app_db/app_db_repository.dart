import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'my_drift_database.dart';

part 'app_db_repository.g.dart';

@riverpod
AppDbRepository appDbRepository(AppDbRepositoryRef ref) =>
    AppDbRepository(ref.watch(myDriftDatabaseProvider));

/// Drift のデータベースを操作するリポジトリ
class AppDbRepository {
  AppDbRepository(this.appDb);

  final MyDriftDatabase appDb;

  /// 疎通確認用
  Future<void> ping() async {
    logger.i('ping');
    final result = await appDb.select(appDb.players).get();
    logger.i(result);
  }
}
