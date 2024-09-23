import 'dart:math';

import 'package:common/common.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../util/enum/hitting_stats_type.dart';
import '../../app_db/my_drift_database.dart';
import '../../app_db/tables.dart';
import '../../search_condition/domain/search_condition.dart';
import '../domain/hitter.dart';
import '../domain/quiz.dart';

part 'hitter_repository.g.dart';

@riverpod
HitterRepository hitterRepository(HitterRepositoryRef ref) {
  final myDriftDatabase = ref.watch(myDriftDatabaseProvider);
  return HitterRepository(myDriftDatabase);
}

class HitterRepository {
  HitterRepository(this.db);

  final MyDriftDatabase db;

  /// [searchWord] で選手を部分検索する。
  Future<List<Hitter>> searchHitter(String searchWord) async {
    final hitterList = await (db.select(db.players)
          ..where(
            (e) =>
                e.nameLast.like('%$searchWord%') |
                e.nameFirst.like('%$searchWord%'),
          ))
        .get();

    return hitterList.map((player) {
      return Hitter(
        id: player.playerId,
        label: '${player.nameFirst} ${player.nameLast}',
      );
    }).toList();
  }

  /// ノーマルクイズを取得する。
  ///
  /// 検索条件に合う選手を1人取得し、その選手の成績からクイズを生成して返す。
  Future<Quiz> fetchNormalQuiz(SearchCondition searchCondition) async {
    // 検索条件に合う選手を1人取得する。
    final totalStat = await _searchTotalStatByCondition(searchCondition);
    final batter = await _fetchBatterById(totalStat.playerId);
    final battingStat = await _fetchBattingStatById(batter.playerId);
    final selectedStatsList =
        searchCondition.selectedStatsList.map(StatsType.fromString).toList();

    final hitterQuiz = _createQuiz(
      batter,
      battingStat,
      totalStat,
      selectedStatsList,
    );
    return hitterQuiz;
  }

  /// デイリークイズを取得する。
  ///
  /// [playerId] から選手情報を取得し、その選手の成績からクイズを生成して返す。
  Future<Quiz> fetchDailyQuiz(
    String playerId,
    List<StatsType> selectedStatsList,
  ) async {
    final totalStats = await _fetchTotalStatById(playerId);
    final batter = await _fetchBatterById(playerId);
    final battingStats = await _fetchBattingStatById(playerId);

    final quiz = _createQuiz(
      batter,
      battingStats,
      totalStats,
      selectedStatsList,
    );
    return quiz;
  }

  /// [searchCondition] に合う通算成績を1人分取得する。
  Future<TotalBattingStat> _searchTotalStatByCondition(
    SearchCondition searchCondition,
  ) async {
    const finalYear = 2023;
    final query = db.select(db.totalBattingStats)
      ..where((stats) => stats.finalYear.equals(finalYear))
      ..where((stats) => stats.finalTeamId.isIn(searchCondition.teamList))
      ..where(
        (stats) => stats.games.isBiggerOrEqualValue(searchCondition.minGames),
      )
      ..where(
        (stats) => stats.hits.isBiggerOrEqualValue(searchCondition.minHits),
      )
      ..where(
        (stats) => stats.homeRuns.isBiggerOrEqualValue(searchCondition.minHr),
      )
      ..orderBy([(stats) => OrderingTerm.random()])
      ..limit(1);

    final responses = await query.get();

    // 検索条件に合致するデータがない場合、例外を返す。
    if (responses.isEmpty) {
      throw DatabaseException.notFound(DataSourceType.drift);
    }

    return responses[0];
  }

  /// [playerId] に対応する通算選手の成績を取得する。
  Future<TotalBattingStat> _fetchTotalStatById(String playerId) async {
    final query = db.select(db.totalBattingStats)
      ..where((stats) => stats.playerId.equals(playerId))
      ..limit(1);

    // todo: こっから下の処理、共通化できそう
    final responses = await query.get();

    // 検索条件に合致するデータがない場合、例外を返す。
    if (responses.isEmpty) {
      throw DatabaseException.notFound(DataSourceType.drift);
    }

    return responses[0];
  }

  Future<Player> _fetchBatterById(String playerId) async {
    final query = db.select(db.players)
      ..where((player) => player.playerId.equals(playerId))
      ..limit(1);

    final responses = await query.get();

    // データがない場合、例外を返す。
    if (responses.isEmpty) {
      throw DatabaseException.notFound(DataSourceType.drift);
    }

    return responses[0];
  }

  Future<List<BattingStat>> _fetchBattingStatById(String playerId) async {
    final query = db.select(db.battingStats)
      ..where((stats) => stats.playerId.equals(playerId))
      ..orderBy([(stats) => OrderingTerm.asc(stats.displayOrder)]);

    final responses = await query.get();

    if (responses.isEmpty) {
      throw DatabaseException.notFound(DataSourceType.drift);
    }

    return responses;
  }

  /// [Quiz] を生成する。
  Quiz _createQuiz(
    Player player,
    List<BattingStat> battingStatList,
    TotalBattingStat totalBattingStat,
    List<StatsType> selectedStatsList,
  ) {
    final yearStats = _createYearStats(
      battingStatList,
      totalBattingStat,
      selectedStatsList,
    );

    return Quiz(
      playerId: player.playerId,
      playerName: '${player.nameFirst} ${player.nameLast}',
      yearStats: yearStats,
      selectedStats: selectedStatsList,
      unveilCount: 0,
      incorrectCount: 0,
    );
  }

  /// [battingStatList] と [totalBattingStat] から [YearStats] のリストを生成する。
  List<YearStats> _createYearStats(
    List<BattingStat> battingStatList,
    TotalBattingStat totalBattingStat,
    List<StatsType> selectedStatsList,
  ) {
    // `YearStats` のリストを生成する。
    // この時点では、すべての `YearStats` の `unveilOrder` が 0 である。
    final yearStats = battingStatList
        .map((stat) => _createYearStat(stat, selectedStatsList))
        .toList();
    yearStats.add(_createTotalYearStat(totalBattingStat, selectedStatsList));

    // 表示順をランダムにする。
    final randomizedYearStats = _randomizeUnveilOrders(yearStats);
    return randomizedYearStats;
  }

  YearStats _createYearStat(
    BattingStat battingStat,
    List<StatsType> selectedStatsList,
  ) {
    final stats = {
      for (final statsType in selectedStatsList)
        statsType: StatsValue(
          unveilOrder: 0,
          data: StatsValue.formatData(
            statsType,
            battingStat.toJson()[statsType.battingStatsColumn]?.toString() ??
                StatsValue.emptyLabel,
          ),
        ),
    };
    return YearStats.perYear(
      displayOrder: battingStat.displayOrder,
      year: battingStat.year.toString(),
      stats: stats,
    );
  }

  YearStats _createTotalYearStat(
    TotalBattingStat totalBattingStat,
    List<StatsType> selectedStatsList,
  ) {
    final stats = {
      for (final statsType in selectedStatsList)
        statsType: StatsValue(
          unveilOrder: 0,
          data: StatsValue.formatData(
            statsType,
            totalBattingStat
                    .toJson()[statsType.battingStatsColumn]
                    ?.toString() ??
                StatsValue.emptyLabel,
          ),
        ),
    };
    return YearStats.total(stats: stats);
  }

  List<YearStats> _randomizeUnveilOrders(List<YearStats> yearStats) {
    final random = Random();
    final allStats = yearStats.expand((ys) => ys.stats.values).toList();
    final orders = List.generate(allStats.length, (i) => i)..shuffle(random);

    var orderIndex = 0;
    return yearStats.map((ys) {
      final newStats = Map.fromEntries(
        ys.stats.entries.map(
          (e) => MapEntry(
            e.key,
            e.value.copyWith(unveilOrder: orders[orderIndex++]),
          ),
        ),
      );
      return ys.copyWith(stats: newStats);
    }).toList();
  }
}
