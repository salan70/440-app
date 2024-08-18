import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_db.dart';

part 'app_db_repository.g.dart';

@riverpod
AppDbRepository appDbRepository(AppDbRepositoryRef ref) =>
    AppDbRepository(ref.watch(appDbProvider));

/// Drift のデータベースを操作するリポジトリ
class AppDbRepository {
  AppDbRepository(this.appDb);

  final AppDb appDb;

  /// 疎通確認用
  Future<void> ping() async {
    logger.i('ping');
    final result = await appDb.select(appDb.players).get();
    logger.i(result);
  }
}
