import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

import 'search_condition.dart';
import 'search_condition_constant.dart';

part 'search_condition_repository.g.dart';

/// [SearchConditionRepository] の Provider.
@riverpod
SearchConditionRepository searchConditionRepository(
  SearchConditionRepositoryRef ref,
) =>
    throw UnimplementedError();

class SearchConditionRepository {
  SearchConditionRepository(this.db);

  final Database db;
  final _store = StoreRef.main();

  Future<SearchCondition> fetch() async {
    final record = await _store.record(SearchCondition.recordName).get(db)
        as Map<String, dynamic>?;

    logger.d(record);

    return record != null
        ? SearchCondition.fromJson(record)
        : defaultSearchCondition;
  }

  Future<void> save(SearchCondition searchCondition) async {
    await _store
        .record(SearchCondition.recordName)
        .put(db, searchCondition.toJson());
  }
}
