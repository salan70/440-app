import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../util/enum/hitting_stats_type.dart';
import '../../../util/extension/date_time_extension.dart';
import '../../daily_quiz/domain/daily_quiz.dart';
import '../../quiz/domain/quiz.dart';
import '../../quiz/domain/quiz_state.dart';
import '../../search_condition/search_condition.dart';
import '../domain/daily_hitter_quiz_result.dart';
import '../domain/hitter_quiz_result.dart';

part 'quiz_result_repository.g.dart';

@riverpod
QuizResultRepository quizResultRepository(QuizResultRepositoryRef ref) =>
    QuizResultRepository(FirebaseFirestore.instance);

class QuizResultRepository {
  QuizResultRepository(this.firestore);

  final FirebaseFirestore firestore;

  Future<void> createDailyQuiz(User user, DailyQuiz dailyQuiz) async {
    await firestore
        .collection('users')
        .doc(user.uid)
        .collection('dailyQuizResult')
        .doc(dailyQuiz.dailyQuizId)
        .set(<String, dynamic>{
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateDailyQuizResult(
    User user,
    DailyQuiz dailyQuiz,
    QuizState quizState,
  ) async {
    final quiz = quizState.quiz;
    final selectedStats = quiz.selectedStats.map((e) => e.label).toList();
    final yearStats = quiz.yearStats.map((e) => e.toFirestoreField()).toList();

    await firestore
        .collection('users')
        .doc(user.uid)
        .collection('dailyQuizResult')
        .doc(dailyQuiz.dailyQuizId)
        .set(<String, dynamic>{
      'questionedAt': dailyQuiz.questionedAt,
      'updatedAt': FieldValue.serverTimestamp(),
      'playerId': quiz.playerId,
      'playerName': quiz.playerName,
      'selectedStats': selectedStats,
      'yearStats': yearStats,
      'unveilCount': quiz.unveilCount,
      'isCorrect': quizState.isCorrectEnteredHitter,
      'incorrectCount': quiz.incorrectCount,
    });
  }

  Future<void> createNormalQuizResult(
    User user,
    QuizState quizState,
    SearchCondition searchCondition,
  ) async {
    final quiz = quizState.quiz;
    final selectedStats = quiz.selectedStats.map((e) => e.label).toList();
    final yearStats = quiz.yearStats.map((e) => e.toFirestoreField()).toList();

    await firestore
        .collection('users')
        .doc(user.uid)
        .collection('normalQuizResult')
        .add(<String, dynamic>{
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'playerId': quiz.playerId,
      'playerName': quiz.playerName,
      'selectedStats': selectedStats,
      'yearStats': yearStats,
      'unveilCount': quiz.unveilCount,
      'isCorrect': quizState.isCorrectEnteredHitter,
      'incorrectCount': quiz.incorrectCount,
      'searchCondition': searchCondition.toJson(),
    });
  }

  Future<List<HitterQuizResult>> fetchNormalQuizResultList(User user) async {
    final QuerySnapshot snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('normalQuizResult')
        .orderBy('createdAt', descending: true)
        .get();

    final hitterQuizResultList = <HitterQuizResult>[];
    for (final document in snapshot.docs) {
      final hitterQuizResult = _toHitterQuizResult(document);
      hitterQuizResultList.add(hitterQuizResult);
    }

    return hitterQuizResultList;
  }

  Future<DailyHitterQuizResult> fetchDailyHitterQuizResult(
    User user,
  ) async {
    final QuerySnapshot snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('dailyQuizResult')
        .orderBy('questionedAt', descending: true)
        .get();

    final resultMap = <String, HitterQuizResult>{};
    for (final document in snapshot.docs) {
      final data = document.data()! as Map<String, dynamic>;

      // documentに「questionedAt」フィールドがある場合のみ、dailyHitterQuizResultListに格納する
      // 「questionedAt」がないということは、ギャラリー（プレイ履歴）として表示することを
      // 想定する前に保存されたdailyQuizResultを意味するため
      if (data.containsKey('questionedAt')) {
        final formattedQuestionedAt =
            (data['questionedAt'] as Timestamp).toDate().toFormattedString();
        final hitterQuizResult = _toHitterQuizResult(document);
        resultMap[formattedQuestionedAt] = hitterQuizResult;
      }
    }
    return DailyHitterQuizResult(resultMap: resultMap);
  }

  /// ドキュメントから [HitterQuizResult] を生成する。
  HitterQuizResult _toHitterQuizResult(
    QueryDocumentSnapshot<Object?> document,
  ) {
    final data = document.data()! as Map<String, dynamic>;
    final hitterQuiz = _toHitterQuiz(document);

    return HitterQuizResult(
      docId: document.id,
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      isCorrect: data['isCorrect'] as bool,
      hitterQuiz: hitterQuiz,
    );
  }

  /// ドキュメントから [Quiz] を生成する。
  Quiz _toHitterQuiz(
    QueryDocumentSnapshot<Object?> document,
  ) {
    final data = document.data()! as Map<String, dynamic>;

    return Quiz(
      playerId: data['playerId'] as String,
      playerName: data['playerName'] as String,
      yearStats: (data['yearStats'] as List<dynamic>)
          .map((e) => YearStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedStats: (data['selectedStats'] as List<dynamic>)
          .map((e) => StatsType.fromString(e as String))
          .toList(),
      unveilCount: data['unveilCount'] as int,
      incorrectCount: data['incorrectCount'] as int,
    );
  }

  Future<bool> existSpecifiedDailyQuizResult(
    User user,
    String dailyQuizId,
  ) async {
    final DocumentSnapshot snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('dailyQuizResult')
        .doc(dailyQuizId)
        .get();

    return snapshot.exists;
  }

  Future<int> fetchPlayedNormalQuizCount(User user) async {
    final snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('normalQuizResult')
        .count()
        .get();

    // TODO(me): ! でいいか確認する。
    return snapshot.count!;
  }

  Future<int> fetchCorrectedNormalQuizCount(User user) async {
    final snapshot = await firestore
        .collection('users')
        .doc(user.uid)
        .collection('normalQuizResult')
        .where('isCorrect', isEqualTo: true)
        .count()
        .get();

    // TODO(me): ! でいいか確認する。
    return snapshot.count!;
  }

  Future<void> deleteNormalQuizResult(User user, String docId) async {
    return firestore
        .collection('users')
        .doc(user.uid)
        .collection('normalQuizResult')
        .doc(docId)
        .delete();
  }
}
