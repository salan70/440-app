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

  /// ノーマルクイズ用の選手情報を取得する。
  ///
  /// 検索条件に合う選手を1人取得し、その選手の成績を取得して返す。
  Future<Quiz> fetchNormalHitterQuiz(
    SearchCondition searchCondition,
  ) async {
    // 検索条件に合う選手を1人取得する。
    final totalBattingStat = await _searchTotalBattingStat(searchCondition);
    final batter = await _fetchBatterById(totalBattingStat.playerId);
    final battingStat = await _fetchBattingStatById(batter.playerId);

    final hitterQuiz = _toHitterQuiz(
      batter,
      battingStat,
      totalBattingStat,
      searchCondition,
    );
    return hitterQuiz;
  }

  /// デイリークイズ用の選手情報を取得する。
  ///
  /// 指定されたデイリークイズの選手 ID から選手情報を取得し、その選手の成績を取得して返す。
  // Future<HitterQuizState> fetchInputDailyQuizState(DailyQuiz dailyQuiz) async {
  //   // 検索条件に合う選手を1人取得する。
  //   final supabaseHitter = await _searchHitterById(dailyQuiz.playerId);

  //   // 取得した選手の成績を取得する。
  //   final statsList = await _fetchHittingStats(supabaseHitter.id);

  //   // InputDailyQuizState に変換して返す。
  //   return HitterConverter().toInputDailyQuizState(
  //     supabaseHitter,
  //     statsList,
  //     dailyQuiz.selectedStatsList,
  //   );
  // }

  /// [searchCondition] に合う通算成績を1人分取得する。
  Future<TotalBattingStat> _searchTotalBattingStat(
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

  Quiz _toHitterQuiz(
    Player player,
    List<BattingStat> battingStatList,
    TotalBattingStat totalBattingStat,
    SearchCondition searchCondition,
  ) {
    final yearStats = _createYearStats(
      battingStatList,
      totalBattingStat,
      searchCondition.selectedStatsList.map(StatsType.fromString).toList(),
    );

    final selectedStats =
        searchCondition.selectedStatsList.map(StatsType.fromString).toList();

    return Quiz(
      playerId: player.playerId,
      playerName: '${player.nameFirst} ${player.nameLast}',
      yearStats: yearStats,
      selectedStats: selectedStats,
      unveilCount: 0,
      incorrectCount: 0,
    );
  }

  /// [battingStatList] と [totalBattingStat] から [YearStats] を生成する。
  List<YearStats> _createYearStats(
    List<BattingStat> battingStatList,
    TotalBattingStat totalBattingStat,
    List<StatsType> selectedStatsList,
  ) {
    final yearStats = <YearStats>[];
    var order = 0;

    // 年度ごとの成績を追加
    for (final battingStat in battingStatList) {
      final statsMap = <StatsType, StatsValue>{};
      for (final stat in selectedStatsList) {
        final value = battingStat.toJson()[stat.battingStatsColumn].toString();
        statsMap[stat] = StatsValue(
          unveilOrder: order++,
          data: StatsValue.formatData(stat, value),
        );
      }
      yearStats.add(
        YearStats(
          year: battingStat.year.toString(),
          stats: statsMap,
        ),
      );
    }

    // 通算成績を追加
    final totalStatsMap = <StatsType, StatsValue>{};
    for (final stat in selectedStatsList) {
      if (stat == StatsType.team) {
        totalStatsMap[stat] = StatsValue(
          unveilOrder: order++,
          data: StatsValue.emptyLabel,
        );
        continue;
      }

      final value =
          totalBattingStat.toJson()[stat.battingStatsColumn].toString();
      totalStatsMap[stat] = StatsValue(
        unveilOrder: order++,
        data: StatsValue.formatData(stat, value),
      );
    }
    yearStats.add(
      YearStats(
        year: YearStats.totalYearLabel,
        stats: totalStatsMap,
      ),
    );

    return yearStats;
  }
}
