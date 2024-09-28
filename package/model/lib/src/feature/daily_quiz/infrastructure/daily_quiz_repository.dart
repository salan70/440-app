import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/daily_quiz.dart';

part 'daily_quiz_repository.g.dart';

@riverpod
DailyQuizRepository dailyQuizRepository(DailyQuizRepositoryRef ref) =>
    DailyQuizRepository(FirebaseFirestore.instance);

class DailyQuizRepository {
  DailyQuizRepository(this.firestore);

  final FirebaseFirestore firestore;

  Future<DailyQuiz?> fetchByQuestionedAt(DateTime questionedAt) async {
    final startDate = DateTime(
      questionedAt.year,
      questionedAt.month,
      questionedAt.day,
    );
    final endDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      23,
      59,
      59,
      999,
    );

    final QuerySnapshot snapshot = await firestore
        .collection('dailyQuiz')
        .orderBy('questionedAt')
        .startAt([Timestamp.fromDate(startDate)])
        .endAt([Timestamp.fromDate(endDate)])
        .limit(1)
        .get();

    final dailyQuizList = snapshot.docs
        .map((doc) => DailyQuiz.fromJson(doc.data()! as Map<String, dynamic>))
        .toList();

    if (dailyQuizList.isEmpty) {
      return null;
    }

    return dailyQuizList[0];
  }
}
