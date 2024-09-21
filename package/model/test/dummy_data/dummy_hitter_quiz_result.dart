import 'package:model/src/feature/quiz_result/domain/hitter_quiz_result.dart';

import 'dummy_hitter.dart';

final dummyHitterQuizResult = HitterQuizResult(
  docId: 'dummyDocId',
  updatedAt: DateTime(2021, 9, 1, 12),
  isCorrect: false,
  hitterQuiz: dummyHitterQuiz,
);
