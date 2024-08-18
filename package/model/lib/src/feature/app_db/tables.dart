import 'package:drift/drift.dart';

class Players extends Table {
  TextColumn get playerId => text()();
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
