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

  // todo: getAsync に変更する
  SearchCondition fetch() =>
      box.get(SearchCondition.defaultId) ?? defaultSearchCondition;

  void save(SearchCondition searchCondition) => box.put(searchCondition);
}
