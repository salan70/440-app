import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/enum/hitting_stats_type.dart';

part 'daily_quiz.freezed.dart';

@freezed
class DailyQuiz with _$DailyQuiz {
  const factory DailyQuiz({
    /// [DailyQuiz] のID.
    required String dailyQuizId,

    /// 出題日時。
    required DateTime questionedAt,

    /// 回答となる選手のID.
    required String playerId,

    /// 出題するデータの種別。
    required List<StatsType> selectedStatsList,
  }) = _DailyQuiz;

  const DailyQuiz._();

  factory DailyQuiz.fromJson(Map<String, dynamic> json) {
    return DailyQuiz(
      dailyQuizId: json['dailyQuizId'] as String,
      questionedAt: DateTime.parse(json['questionedAt'] as String),
      playerId: json['playerId'] as String,
      selectedStatsList: (json['selectedStatsList'] as List)
          .map((e) => StatsType.fromString(e as String))
          .toList(),
    );
  }
}
