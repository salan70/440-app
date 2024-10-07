import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  SearchConditionRepository(this.box);

  final Box<SearchCondition> box;

  Future<SearchCondition> fetch() async =>
      box.get(SearchCondition.defaultId) ?? defaultSearchCondition;

  Future<void> save(SearchCondition searchCondition) async =>
      box.put(searchCondition);
}
