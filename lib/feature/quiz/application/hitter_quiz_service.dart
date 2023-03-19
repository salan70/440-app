import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/constant/hitting_stats_constant.dart';
import '../../daily_quiz/domain/daily_quiz.dart';
import '../../quiz_result/domain/hitter_quiz_result.dart';
import '../../search_condition/application/search_condition_state.dart';
import '../domain/hitter.dart';
import '../domain/hitter_quiz.dart';
import '../domain/hitter_repository.dart';
import 'answer_state.dart';
import 'hitter_quiz_state.dart';

/// HitterQuizサービスプロバイダー
final hitterQuizServiceProvider = Provider(
  HitterQuizService.new,
);

/// HitterQuizサービス
///
/// HitterQuizに関する操作を提供する
/// Widgetから呼ばれ、各RepositoryやStateを操作するロジックを実装する
class HitterQuizService {
  HitterQuizService(this.ref);
  final Ref ref;

  /// 検索条件をもとに出題する選手を取得する
  Future<void> fetchHitterQuizBySearchCondition() async {
    final notifier = ref.read(hitterQuizStateProvider.notifier);

    notifier.state = const AsyncValue.loading();

    late HitterQuiz hitterQuiz;
    notifier.state = await AsyncValue.guard(() async {
      final searchCondition = ref.watch(searchConditionProvider);
      hitterQuiz = await ref
          .watch(hitterRepositoryProvider)
          .fetchHitterQuizBySearchCondition(searchCondition);
      return null;
    });

    notifier.state = AsyncData(hitterQuiz);
  }

  /// IDをもとに出題する選手を取得する
  /// 今日の1問用
  Future<void> fetchHitterQuizById(DailyQuiz dailyQuiz) async {
    final notifier = ref.read(hitterQuizStateProvider.notifier);

    notifier.state = const AsyncValue.loading();

    late HitterQuiz hitterQuiz;
    notifier.state = await AsyncValue.guard(() async {
      hitterQuiz = await ref
          .watch(hitterRepositoryProvider)
          .fetchHitterQuizById(dailyQuiz);
      return null;
    });

    notifier.state = AsyncData(hitterQuiz);
  }

  // TODO(me): テスト書くことを検討する
  /// ランダムに1つ成績を公開する
  void openRandom() {
    final notifier = ref.read(hitterQuizStateProvider.notifier);
    final hitterQuiz = notifier.state.value;
    notifier.state = AsyncData(
      hitterQuiz!.copyWith(
        unveilCount: hitterQuiz.unveilCount + 1,
      ),
    );
  }

  // TODO(me): テスト書く
  /// 成績が公開可能か判別する
  /// 閉じている成績が残っている場合、成績が公開可能とみなす
  bool canOpen() {
    final hitterQuiz = ref.read(hitterQuizStateProvider).value;
    final totalStatsCount =
        hitterQuiz!.statsMapList.length * hitterQuiz.selectedStatsList.length;

    return hitterQuiz.unveilCount < totalStatsCount;
  }

  // TODO(me): テスト書くことを検討する
  /// 全ての閉じている成績を公開する
  void openAll() {
    final notifier = ref.read(hitterQuizStateProvider.notifier);
    final hitterQuiz = notifier.state.value;
    final totalStatsCount =
        hitterQuiz!.statsMapList.length * hitterQuiz.selectedStatsList.length;

    notifier.state = AsyncData(
      hitterQuiz.copyWith(
        unveilCount: totalStatsCount,
      ),
    );
  }

  /// 選手名で検索する
  Future<List<Hitter>> searchHitter(String searchWord) async {
    final allHitterList = await ref.read(allHitterListProvider);
    final hitterListAfterSearch = <Hitter>[];

    for (final hitter in allHitterList) {
      if (hitter.label.contains(searchWord)) {
        hitterListAfterSearch.add(hitter);
      }
    }

    return hitterListAfterSearch;
  }

  /// 正解しているか否かを返す
  bool isCorrectHitterQuiz() {
    final submittedHitter = ref.read(submittedHitterProvider);
    if (submittedHitter == null) {
      return false;
    }
    final hitterQuiz = ref.read(hitterQuizStateProvider);

    return submittedHitter.id == hitterQuiz.value!.id;
  }

  /// hitterQuizのisCorrectをtrueにする
  void markCorrect() {
    final notifier = ref.read(hitterQuizStateProvider.notifier);
    final hitterQuiz = notifier.state.value;

    notifier.state = AsyncData(
      hitterQuiz!.copyWith(
        isCorrect: true,
      ),
    );
  }

  /// 不正解数を1増やす
  void addIncorrectCount() {
    final notifier = ref.read(hitterQuizStateProvider.notifier);
    final hitterQuiz = notifier.state.value;

    notifier.state = AsyncData(
      hitterQuiz!.copyWith(
        incorrectCount: hitterQuiz.incorrectCount + 1,
      ),
    );
  }

  // TODO(me): UT書く
  /// 最後の回答かどうかを返す
  bool isFinalAnswer(int? maxCanIncorrectCount) {
    if (maxCanIncorrectCount == null) {
      return false;
    }

    final hitterQuiz = ref.read(hitterQuizStateProvider);
    return hitterQuiz.value!.incorrectCount == maxCanIncorrectCount;
  }

  /// HitterQuizResultからHitterQuizを作成し、hitterQuizStateに格納する
  void fromHitterQuizResult(
    HitterQuizResult hitterQuizResult,
    QuizType quizType,
  ) {
    final hitterQuiz = HitterQuiz(
      id: hitterQuizResult.id,
      name: hitterQuizResult.name,
      quizType: quizType,
      yearList: hitterQuizResult.yearList,
      selectedStatsList: hitterQuizResult.selectedStatsList,
      statsMapList: hitterQuizResult.statsMapList,
      unveilCount: hitterQuizResult.unveilCount,
      isCorrect: hitterQuizResult.isCorrect,
      incorrectCount: hitterQuizResult.incorrectCount,
    );
    ref.read(hitterQuizStateProvider.notifier).state = AsyncData(hitterQuiz);
  }
}
