import 'package:model/src/feature/quiz/domain/quiz.dart';
import 'package:model/src/feature/search_condition/search_condition.dart';
import 'package:model/src/util/enum/hitting_stats_type.dart';

const dummySearchCondition = SearchCondition(
  teamList: ['横浜DeNAベイスターズ'],
  minGames: 100,
  minHits: 100,
  minHr: 10,
  selectedStatsList: ['球団', '打率', '本塁打', 'OPS'],
);

const dummyStats = {
  StatsType.team: StatsValue(unveilOrder: 12, data: 'DeNA'),
  StatsType.battingAverage: StatsValue(unveilOrder: 12, data: '0.314'),
  StatsType.homeRuns: StatsValue(unveilOrder: 12, data: '22'),
  StatsType.onBasePlusSlugging: StatsValue(unveilOrder: 12, data: '0.89'),
};

const dummyHitterQuiz = Quiz(
  playerId: '9d377b08-3b1d-4ff2-892f-597c404e4b7d',
  playerName: '牧秀悟',
  yearStats: [
    YearStats.perYear(displayOrder: 0, year: '2021', stats: dummyStats),
    YearStats.perYear(displayOrder: 1, year: '2021', stats: dummyStats),
    YearStats.perYear(displayOrder: 2, year: '2022', stats: dummyStats),
    YearStats.perYear(displayOrder: 3, year: '2023', stats: dummyStats),
    YearStats.total(stats: dummyStats),
  ],
  selectedStats: [
    StatsType.team,
    StatsType.battingAverage,
    StatsType.homeRuns,
    StatsType.onBasePlusSlugging,
  ],
  unveilCount: 0,
  incorrectCount: 0,
);
