import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'search_condition.dart';
import 'search_condition_repository.dart';

part 'search_condition_state.g.dart';

/// ノーマルクイズの検索条件を保持するプロバイダー。
@riverpod
Future<SearchCondition> searchCondition(SearchConditionRef ref) async =>
    ref.watch(searchConditionRepositoryProvider).fetch();
