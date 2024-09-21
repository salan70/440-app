import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../search_condition/application/search_condition_state.dart';
import '../domain/hitter_quiz_state.dart';
import '../infrastructure/hitter_repository.dart';

part 'hitter_quiz_state_provider.g.dart';

/// 保存されている検索条件をもとに [HitterQuizState] を取得する。
@riverpod
Future<HitterQuizState> normalQuizState(NormalQuizStateRef ref) async {
  final searchCondition = ref.watch(searchConditionProvider);

  final hitterQuiz = await ref
      .watch(hitterRepositoryProvider)
      .fetchNormalHitterQuiz(searchCondition);

  return HitterQuizState.normal(hitterQuiz: hitterQuiz, enteredHitter: null);
}
