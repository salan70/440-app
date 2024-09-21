import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/enum/hitting_stats_type.dart';
import '../../../util/extension/string_extension.dart';

part 'quiz.freezed.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    /// 回答となる選手のID.
    required String playerId,

    /// 回答となる選手の名前。
    required String playerName,

    /// 年ごとのデータ。
    required List<YearStats> yearStats,

    /// 出題するデータの種別。
    required List<StatsType> selectedStats,

    /// ユーザーが公開したデータの数。
    required int unveilCount,

    /// ユーザーが不正解した数。
    required int incorrectCount,
  }) = _Quiz;

  const Quiz._();

  int get totalStatsCount => yearStats.length * selectedStats.length;

  bool get isAllStatsUnveiled => unveilCount >= totalStatsCount;
}

@freezed
class YearStats with _$YearStats {
  const factory YearStats({
    required String year,
    required Map<StatsType, StatsValue> stats,
  }) = _YearStats;

  factory YearStats.fromJson(Map<String, dynamic> json) => YearStats(
        year: json['year'] as String,
        stats: (json['stats'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            StatsType.fromString(key),
            StatsValue.fromJson(value as Map<String, dynamic>),
          ),
        ),
      );
}

@freezed
class StatsValue with _$StatsValue {
  const factory StatsValue({
    /// 表示順。
    required int unveilOrder,

    /// 成績（データ）。
    required String data,
  }) = _StatsValue;

  factory StatsValue.fromJson(Map<String, dynamic> json) => StatsValue(
        unveilOrder: json['unveilOrder'] as int,
        data: json['data'] as String,
      );

  static String formatData(StatsType statsType, String data) {
    if (statsType.isPercentage) {
      return data.toPercent;
    }

    if (statsType.isDecimal) {
      final decimalWithZero = data.decimalWithZero;
      return decimalWithZero.removeZeroPrefix;
    }

    if (statsType.isDecimalWithZero) {
      return data.decimalWithZero;
    }

    return data;
  }
}
