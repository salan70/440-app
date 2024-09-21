import 'package:drift/drift.dart';

import '../../util/enum/hitting_stats_type.dart';

class Players extends Table {
  TextColumn get playerId => text().named('playerId')();
  TextColumn get nameFirst => text().withLength(min: 1, max: 50).nullable()();
  TextColumn get nameLast => text().withLength(min: 1, max: 50)();

  @override
  Set<Column> get primaryKey => {playerId};
}

class BattingStats extends Table {
  TextColumn get playerId => text()();
  IntColumn get displayOrder => integer()();
  IntColumn get year => integer()();
  TextColumn get teamId => text().withLength(min: 1, max: 50)();
  IntColumn get games => integer().named('G')();
  IntColumn get plateAppearances => integer().named('PA')();
  IntColumn get atBats => integer().named('AB')();
  IntColumn get hits => integer().named('H')();
  IntColumn get extraBaseHits => integer().named('XBH')();
  IntColumn get totalBases => integer().named('TB')();
  IntColumn get doubles => integer().named('2B')();
  IntColumn get triples => integer().named('3B')();
  IntColumn get homeRuns => integer().named('HR')();
  IntColumn get runs => integer().named('R')();
  IntColumn get runsBattedIn => integer().named('RBI')();
  IntColumn get walks => integer().named('BB')();
  IntColumn get intentionalWalks => integer().named('IBB')();
  IntColumn get hitByPitch => integer().named('HBP')();
  IntColumn get strikeouts => integer().named('SO')();
  IntColumn get stolenBases => integer().named('SB')();
  IntColumn get caughtStealing => integer().named('CS')();
  IntColumn get sacrificeHits => integer().named('SAC')();
  IntColumn get sacrificeFlies => integer().named('SF')();
  IntColumn get groundedIntoDoublePlays => integer().named('GIDP')();
  RealColumn get battingAverage => real().named('AVG').nullable()();
  RealColumn get onBasePercentage => real().named('OBP').nullable()();
  RealColumn get sluggingPercentage => real().named('SLG').nullable()();
  RealColumn get onBasePlusSlugging => real().named('OPS').nullable()();
  RealColumn get battingAverageOnBallsInPlay =>
      real().named('BABIP').nullable()();
  RealColumn get isolatedPower => real().named('ISO').nullable()();
  RealColumn get atBatsPerHomeRun => real().named('AB/HR').nullable()();
  RealColumn get walkToStrikeoutRatio => real().named('BB/K').nullable()();
  RealColumn get walkPercentage => real().named('BB%').nullable()();
  RealColumn get strikeoutPercentage => real().named('SO%').nullable()();

  @override
  Set<Column> get primaryKey => {playerId, displayOrder};
}

class TotalBattingStats extends Table {
  TextColumn get playerId => text()();
  IntColumn get finalYear => integer()();
  TextColumn get finalTeamId => text().withLength(min: 1, max: 50)();
  IntColumn get games => integer().named('G')();
  IntColumn get plateAppearances => integer().named('PA')();
  IntColumn get atBats => integer().named('AB')();
  IntColumn get hits => integer().named('H')();
  IntColumn get extraBaseHits => integer().named('XBH')();
  IntColumn get totalBases => integer().named('TB')();
  IntColumn get doubles => integer().named('2B')();
  IntColumn get triples => integer().named('3B')();
  IntColumn get homeRuns => integer().named('HR')();
  IntColumn get runs => integer().named('R')();
  IntColumn get runsBattedIn => integer().named('RBI')();
  IntColumn get walks => integer().named('BB')();
  IntColumn get intentionalWalks => integer().named('IBB')();
  IntColumn get hitByPitch => integer().named('HBP')();
  IntColumn get strikeouts => integer().named('SO')();
  IntColumn get stolenBases => integer().named('SB')();
  IntColumn get caughtStealing => integer().named('CS')();
  IntColumn get sacrificeHits => integer().named('SAC')();
  IntColumn get sacrificeFlies => integer().named('SF')();
  IntColumn get groundedIntoDoublePlays => integer().named('GIDP')();
  RealColumn get battingAverage => real().named('AVG').nullable()();
  RealColumn get onBasePercentage => real().named('OBP').nullable()();
  RealColumn get sluggingPercentage => real().named('SLG').nullable()();
  RealColumn get onBasePlusSlugging => real().named('OPS').nullable()();
  RealColumn get battingAverageOnBallsInPlay =>
      real().named('BABIP').nullable()();
  RealColumn get isolatedPower => real().named('ISO').nullable()();
  RealColumn get atBatsPerHomeRun => real().named('AB/HR').nullable()();
  RealColumn get walkToStrikeoutRatio => real().named('BB/K').nullable()();
  RealColumn get walkPercentage => real().named('BB%').nullable()();
  RealColumn get strikeoutPercentage => real().named('SO%').nullable()();

  @override
  Set<Column> get primaryKey => {playerId};
}

extension StatsTypeExtension on StatsType {
  String get battingStatsColumn {
    switch (this) {
      case StatsType.team:
        return 'teamId';
      case StatsType.games:
        return 'games';
      case StatsType.plateAppearances:
        return 'plateAppearances';
      case StatsType.atBats:
        return 'atBats';
      case StatsType.hits:
        return 'hits';
      case StatsType.extraBaseHits:
        return 'extraBaseHits';
      case StatsType.totalBases:
        return 'totalBases';
      case StatsType.doubles:
        return 'doubles';
      case StatsType.triples:
        return 'triples';
      case StatsType.homeRuns:
        return 'homeRuns';
      case StatsType.runs:
        return 'runs';
      case StatsType.runsBattedIn:
        return 'runsBattedIn';
      case StatsType.walks:
        return 'walks';
      case StatsType.intentionalWalks:
        return 'intentionalWalks';
      case StatsType.hitByPitch:
        return 'hitByPitch';
      case StatsType.strikeouts:
        return 'strikeouts';
      case StatsType.stolenBases:
        return 'stolenBases';
      case StatsType.caughtStealing:
        return 'caughtStealing';
      case StatsType.sacrificeHits:
        return 'sacrificeHits';
      case StatsType.sacrificeFlies:
        return 'sacrificeFlies';
      case StatsType.groundedIntoDoublePlays:
        return 'groundedIntoDoublePlays';
      case StatsType.battingAverage:
        return 'battingAverage';
      case StatsType.onBasePercentage:
        return 'onBasePercentage';
      case StatsType.sluggingPercentage:
        return 'sluggingPercentage';
      case StatsType.onBasePlusSlugging:
        return 'onBasePlusSlugging';
      case StatsType.battingAverageOnBallsInPlay:
        return 'battingAverageOnBallsInPlay';
      case StatsType.isolatedPower:
        return 'isolatedPower';
      case StatsType.atBatsPerHomeRun:
        return 'atBatsPerHomeRun';
      case StatsType.walkToStrikeoutRatio:
        return 'walkToStrikeoutRatio';
      case StatsType.walkPercentage:
        return 'walkPercentage';
      case StatsType.strikeoutPercentage:
        return 'strikeoutPercentage';
    }
  }
}
