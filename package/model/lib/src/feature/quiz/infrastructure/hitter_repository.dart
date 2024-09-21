import 'package:common/common.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../util/enum/hitting_stats_type.dart';
import '../../app_db/my_drift_database.dart';
import '../../app_db/tables.dart';
import '../../search_condition/domain/search_condition.dart';
import '../domain/hitter.dart';
import '../domain/hitter_quiz.dart';
import '../domain/stats_value.dart';

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
  Future<HitterQuiz> fetchNormalHitterQuiz(
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
    final query = db.select(db.totalBattingStats)
      // todo: 定数として定義する
      ..where((stats) => stats.finalYear.equals(2023))
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

  HitterQuiz _toHitterQuiz(
    Player player,
    List<BattingStat> battingStatList,
    TotalBattingStat totalBattingStat,
    SearchCondition searchCondition,
  ) {
    final statsMapList = _createStatsMapFromBattingStat(
      battingStatList,
      searchCondition.selectedStatsList.map(StatsType.fromString).toList(),
    );
    // _createStatsMap(totalBattingStat, searchCondition.selectedStatsList),

    final yearList = <String>[];
    for (final battingStat in battingStatList) {
      yearList.add(battingStat.year.toString());
    }

    return HitterQuiz(
      hitterId: player.playerId,
      hitterName: '${player.nameFirst} ${player.nameLast}',
      yearList: yearList,
      selectedStatsList: searchCondition.selectedStatsList,
      statsMapList: statsMapList,
      unveilCount: 0,
      incorrectCount: 0,
    );
  }

  List<Map<String, StatsValue>> _createStatsMapFromBattingStat(
    List<BattingStat> battingStatList,
    List<StatsType> selectedStatsList,
  ) {
    final statsMapList = <Map<String, StatsValue>>[];
    // todo: ランダムにする
    var order = 0;

    for (final battingStat in battingStatList) {
      final statsMap = <String, StatsValue>{};
      for (final stat in selectedStatsList) {
        final value = battingStat.toJson()[stat.battingStatsColumn].toString();
        statsMap[stat.displayLabel] = StatsValue(
          unveilOrder: order++,
          data: StatsValue.formatData(stat, value),
        );
      }
      statsMapList.add(statsMap);
    }

    return statsMapList;
  }
}
