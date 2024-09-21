import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/enum/hitting_stats_type.dart';
import '../../../util/extension/string_extension.dart';

part 'stats_value.freezed.dart';
part 'stats_value.g.dart';

/// 成績の値と表示順を表すクラス
///
/// unveilOrder : 表示順,
/// data : 成績（データ）
@freezed
class StatsValue with _$StatsValue {
  const factory StatsValue({
    required int unveilOrder,
    required String data,
  }) = _StatsValue;

  factory StatsValue.fromJson(Map<String, dynamic> json) {
    return _$StatsValueFromJson(json);
  }

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
