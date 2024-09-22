import 'package:flutter/material.dart';
import 'package:model/model.dart';

class ResultText extends StatelessWidget {
  const ResultText({super.key, required this.quizState});

  final QuizState quizState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 64,
        child: quizState.isCorrectEnteredHitter
            ? const Text('正解！')
            : Column(
                children: [
                  const Text('残念...'),
                  Text('正解は、${quizState.quiz.playerName}選手でした。'),
                ],
              ),
      ),
    );
  }
}
