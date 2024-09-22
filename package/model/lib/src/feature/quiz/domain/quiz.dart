import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/enum/hitting_stats_type.dart';
import '../../../util/extension/string_extension.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  // TODO(me): named constructor を使いたい。
  // 問題作成時は、必ず `unveilCount` と `incorrectCount` が 0 であるため。
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

@immutable
class YearStats {
  factory YearStats.fromJson(Map<String, dynamic> json) {
    final stats = (json['stats'] as Map<String, dynamic>).map(
      (key, value) => MapEntry(
        StatsType.fromString(key),
        StatsValue.fromJson(value as Map<String, dynamic>),
      ),
    );

    // TODO(me): `displayOrder` が `null` かどうかで判断しないほうがいいかも。
    // ※ `copyWith` も同様。
    if (json['displayOrder'] != null) {
      return YearStats.perYear(
        displayOrder: json['displayOrder'] as int,
        year: json['year'] as String,
        stats: stats,
      );
    }

    return YearStats.total(stats: stats);
  }

  /// 年度ごとの成績。
  const YearStats.perYear({
    required this.displayOrder,
    required this.year,
    required this.stats,
  });

  /// 通算成績。
  const YearStats.total({
    required this.stats,
  })  : displayOrder = null,
        year = totalYearLabel;

  /// 表示順。
  ///
  /// 小さい順に上から並んで表示される。
  /// [year] が重複する可能性があるため、このフィールドが必要。
  ///
  /// [YearStats.total] の場合は `null` となる。
  final int? displayOrder;

  /// 年度。
  ///
  /// [YearStats.total] の場合は `totalYearLabel` の値が入る。
  final String year;

  /// 成績。
  final Map<StatsType, StatsValue> stats;

  /// Firestore のフィールドに保存する形式に変換する。
  Map<String, dynamic> toFirestoreField() => {
        'displayOrder': displayOrder,
        'year': year,
        'stats': stats.map(
          (key, value) => MapEntry(key.label, value.toJson()),
        ),
      };

  YearStats copyWith({
    int? displayOrder,
    String? year,
    Map<StatsType, StatsValue>? stats,
  }) {
    if (this.displayOrder != null) {
      return YearStats.perYear(
        displayOrder: displayOrder ?? this.displayOrder!,
        year: year ?? this.year,
        stats: stats ?? this.stats,
      );
    }
    return YearStats.total(
      stats: stats ?? this.stats,
    );
  }

  static const String totalYearLabel = 'Total';
}

@freezed
class StatsValue with _$StatsValue {
  const factory StatsValue({
    /// 表示順。
    required int unveilOrder,

    /// 成績（データ）。
    required String data,
  }) = _StatsValue;
  const StatsValue._();

  factory StatsValue.fromJson(Map<String, dynamic> json) => StatsValue(
        unveilOrder: json['unveilOrder'] as int,
        data: json['data'] as String,
      );

  static const String emptyLabel = '-';

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
