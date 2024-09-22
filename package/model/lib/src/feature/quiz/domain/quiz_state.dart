import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/enum/quiz_type.dart';
import 'hitter.dart';
import 'quiz.dart';

@immutable
class QuizState {
  const QuizState.normal({
    required this.quiz,
    required this.enteredHitter,
  }) : quizType = QuizType.normal;

  const QuizState.daily({
    required this.quiz,
    required this.enteredHitter,
  }) : quizType = QuizType.daily;

  final Quiz quiz;
  final Hitter? enteredHitter;
  final QuizType quizType;

  bool get isCorrectEnteredHitter => enteredHitter?.id == quiz.playerId;

  QuizState copyWith({
    Quiz? quiz,
    Hitter? enteredHitter,
  }) {
    switch (quizType) {
      case QuizType.normal:
        return QuizState.normal(
          quiz: quiz ?? this.quiz,
          enteredHitter: enteredHitter ?? this.enteredHitter,
        );

      case QuizType.daily:
        return QuizState.daily(
          quiz: quiz ?? this.quiz,
          enteredHitter: enteredHitter ?? this.enteredHitter,
        );
    }
  }
}
