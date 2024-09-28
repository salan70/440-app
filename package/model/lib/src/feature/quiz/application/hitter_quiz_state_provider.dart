import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../search_condition/application/search_condition_state.dart';
import '../domain/quiz_state.dart';
import '../infrastructure/hitter_repository.dart';

part 'hitter_quiz_state_provider.g.dart';

/// 保存されている検索条件をもとに [QuizState] を取得する。
@riverpod
Future<QuizState> normalQuizState(NormalQuizStateRef ref) async {
  final searchCondition = ref.watch(searchConditionProvider);

  final hitterQuiz = await ref
      .watch(hitterRepositoryProvider)
      .fetchNormalQuiz(searchCondition);

  return QuizState.normal(quiz: hitterQuiz, enteredHitter: null);
}
