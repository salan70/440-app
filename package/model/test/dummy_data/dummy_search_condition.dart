import 'package:model/src/feature/search_condition/search_condition.dart';
import 'package:model/src/util/enum/hitting_stats_type.dart';

/// 1つの球団を選択しているダミーデータ
final dummySearchCondition1 = SearchCondition(
  id: SearchCondition.defaultId,
  teamList: [
    '千葉ロッテマリーンズ',
  ],
  minGames: 0,
  minHits: 0,
  minHr: 0,
  selectedStatsList: [
    StatsType.team.label,
    StatsType.battingAverage.label,
    StatsType.homeRuns.label,
    StatsType.onBasePlusSlugging.label,
  ],
);

/// 2つの球団を選択しているダミーデータ
final dummySearchCondition2 = SearchCondition(
  id: SearchCondition.defaultId,
  teamList: [
    '千葉ロッテマリーンズ',
    '阪神タイガース',
  ],
  minGames: 0,
  minHits: 0,
  minHr: 0,
  selectedStatsList: [
    StatsType.team.label,
    StatsType.battingAverage.label,
    StatsType.homeRuns.label,
    StatsType.onBasePlusSlugging.label,
  ],
);
