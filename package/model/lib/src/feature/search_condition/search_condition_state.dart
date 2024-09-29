import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'search_condition.dart';
import 'search_condition_repository.dart';

part 'search_condition_state.g.dart';

/// ノーマルクイズの検索条件を保持するプロバイダー。
@riverpod
SearchCondition searchCondition(SearchConditionRef ref) =>
    ref.watch(searchConditionRepositoryProvider).fetchSearchCondition();
