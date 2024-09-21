// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_drift_database.dart';

// ignore_for_file: type=lint
class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _playerIdMeta =
      const VerificationMeta('playerId');
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
      'playerId', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameFirstMeta =
      const VerificationMeta('nameFirst');
  @override
  late final GeneratedColumn<String> nameFirst = GeneratedColumn<String>(
      'nameFirst', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _nameLastMeta =
      const VerificationMeta('nameLast');
  @override
  late final GeneratedColumn<String> nameLast = GeneratedColumn<String>(
      'nameLast', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [playerId, nameFirst, nameLast];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('playerId')) {
      context.handle(_playerIdMeta,
          playerId.isAcceptableOrUnknown(data['playerId']!, _playerIdMeta));
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('nameFirst')) {
      context.handle(_nameFirstMeta,
          nameFirst.isAcceptableOrUnknown(data['nameFirst']!, _nameFirstMeta));
    }
    if (data.containsKey('nameLast')) {
      context.handle(_nameLastMeta,
          nameLast.isAcceptableOrUnknown(data['nameLast']!, _nameLastMeta));
    } else if (isInserting) {
      context.missing(_nameLastMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {playerId};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      playerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playerId'])!,
      nameFirst: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nameFirst']),
      nameLast: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nameLast'])!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final String playerId;
  final String? nameFirst;
  final String nameLast;
  const Player(
      {required this.playerId, this.nameFirst, required this.nameLast});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['playerId'] = Variable<String>(playerId);
    if (!nullToAbsent || nameFirst != null) {
      map['nameFirst'] = Variable<String>(nameFirst);
    }
    map['nameLast'] = Variable<String>(nameLast);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      playerId: Value(playerId),
      nameFirst: nameFirst == null && nullToAbsent
          ? const Value.absent()
          : Value(nameFirst),
      nameLast: Value(nameLast),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      playerId: serializer.fromJson<String>(json['playerId']),
      nameFirst: serializer.fromJson<String?>(json['nameFirst']),
      nameLast: serializer.fromJson<String>(json['nameLast']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playerId': serializer.toJson<String>(playerId),
      'nameFirst': serializer.toJson<String?>(nameFirst),
      'nameLast': serializer.toJson<String>(nameLast),
    };
  }

  Player copyWith(
          {String? playerId,
          Value<String?> nameFirst = const Value.absent(),
          String? nameLast}) =>
      Player(
        playerId: playerId ?? this.playerId,
        nameFirst: nameFirst.present ? nameFirst.value : this.nameFirst,
        nameLast: nameLast ?? this.nameLast,
      );
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      nameFirst: data.nameFirst.present ? data.nameFirst.value : this.nameFirst,
      nameLast: data.nameLast.present ? data.nameLast.value : this.nameLast,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('playerId: $playerId, ')
          ..write('nameFirst: $nameFirst, ')
          ..write('nameLast: $nameLast')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(playerId, nameFirst, nameLast);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.playerId == this.playerId &&
          other.nameFirst == this.nameFirst &&
          other.nameLast == this.nameLast);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<String> playerId;
  final Value<String?> nameFirst;
  final Value<String> nameLast;
  final Value<int> rowid;
  const PlayersCompanion({
    this.playerId = const Value.absent(),
    this.nameFirst = const Value.absent(),
    this.nameLast = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlayersCompanion.insert({
    required String playerId,
    this.nameFirst = const Value.absent(),
    required String nameLast,
    this.rowid = const Value.absent(),
  })  : playerId = Value(playerId),
        nameLast = Value(nameLast);
  static Insertable<Player> custom({
    Expression<String>? playerId,
    Expression<String>? nameFirst,
    Expression<String>? nameLast,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (playerId != null) 'playerId': playerId,
      if (nameFirst != null) 'nameFirst': nameFirst,
      if (nameLast != null) 'nameLast': nameLast,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlayersCompanion copyWith(
      {Value<String>? playerId,
      Value<String?>? nameFirst,
      Value<String>? nameLast,
      Value<int>? rowid}) {
    return PlayersCompanion(
      playerId: playerId ?? this.playerId,
      nameFirst: nameFirst ?? this.nameFirst,
      nameLast: nameLast ?? this.nameLast,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playerId.present) {
      map['playerId'] = Variable<String>(playerId.value);
    }
    if (nameFirst.present) {
      map['nameFirst'] = Variable<String>(nameFirst.value);
    }
    if (nameLast.present) {
      map['nameLast'] = Variable<String>(nameLast.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('playerId: $playerId, ')
          ..write('nameFirst: $nameFirst, ')
          ..write('nameLast: $nameLast, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BattingStatsTable extends BattingStats
    with TableInfo<$BattingStatsTable, BattingStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BattingStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _playerIdMeta =
      const VerificationMeta('playerId');
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
      'playerId', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayOrderMeta =
      const VerificationMeta('displayOrder');
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
      'displayOrder', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  @override
  late final GeneratedColumn<String> teamId = GeneratedColumn<String>(
      'teamId', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _gamesMeta = const VerificationMeta('games');
  @override
  late final GeneratedColumn<int> games = GeneratedColumn<int>(
      'G', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _plateAppearancesMeta =
      const VerificationMeta('plateAppearances');
  @override
  late final GeneratedColumn<int> plateAppearances = GeneratedColumn<int>(
      'PA', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _atBatsMeta = const VerificationMeta('atBats');
  @override
  late final GeneratedColumn<int> atBats = GeneratedColumn<int>(
      'AB', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hitsMeta = const VerificationMeta('hits');
  @override
  late final GeneratedColumn<int> hits = GeneratedColumn<int>(
      'H', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _extraBaseHitsMeta =
      const VerificationMeta('extraBaseHits');
  @override
  late final GeneratedColumn<int> extraBaseHits = GeneratedColumn<int>(
      'XBH', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalBasesMeta =
      const VerificationMeta('totalBases');
  @override
  late final GeneratedColumn<int> totalBases = GeneratedColumn<int>(
      'TB', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _doublesMeta =
      const VerificationMeta('doubles');
  @override
  late final GeneratedColumn<int> doubles = GeneratedColumn<int>(
      '2B', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _triplesMeta =
      const VerificationMeta('triples');
  @override
  late final GeneratedColumn<int> triples = GeneratedColumn<int>(
      '3B', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _homeRunsMeta =
      const VerificationMeta('homeRuns');
  @override
  late final GeneratedColumn<int> homeRuns = GeneratedColumn<int>(
      'HR', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _runsMeta = const VerificationMeta('runs');
  @override
  late final GeneratedColumn<int> runs = GeneratedColumn<int>(
      'R', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _runsBattedInMeta =
      const VerificationMeta('runsBattedIn');
  @override
  late final GeneratedColumn<int> runsBattedIn = GeneratedColumn<int>(
      'RBI', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _walksMeta = const VerificationMeta('walks');
  @override
  late final GeneratedColumn<int> walks = GeneratedColumn<int>(
      'BB', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intentionalWalksMeta =
      const VerificationMeta('intentionalWalks');
  @override
  late final GeneratedColumn<int> intentionalWalks = GeneratedColumn<int>(
      'IBB', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hitByPitchMeta =
      const VerificationMeta('hitByPitch');
  @override
  late final GeneratedColumn<int> hitByPitch = GeneratedColumn<int>(
      'HBP', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _strikeoutsMeta =
      const VerificationMeta('strikeouts');
  @override
  late final GeneratedColumn<int> strikeouts = GeneratedColumn<int>(
      'SO', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stolenBasesMeta =
      const VerificationMeta('stolenBases');
  @override
  late final GeneratedColumn<int> stolenBases = GeneratedColumn<int>(
      'SB', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _caughtStealingMeta =
      const VerificationMeta('caughtStealing');
  @override
  late final GeneratedColumn<int> caughtStealing = GeneratedColumn<int>(
      'CS', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sacrificeHitsMeta =
      const VerificationMeta('sacrificeHits');
  @override
  late final GeneratedColumn<int> sacrificeHits = GeneratedColumn<int>(
      'SAC', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sacrificeFliesMeta =
      const VerificationMeta('sacrificeFlies');
  @override
  late final GeneratedColumn<int> sacrificeFlies = GeneratedColumn<int>(
      'SF', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _groundedIntoDoublePlaysMeta =
      const VerificationMeta('groundedIntoDoublePlays');
  @override
  late final GeneratedColumn<int> groundedIntoDoublePlays =
      GeneratedColumn<int>('GIDP', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _battingAverageMeta =
      const VerificationMeta('battingAverage');
  @override
  late final GeneratedColumn<double> battingAverage = GeneratedColumn<double>(
      'AVG', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _onBasePercentageMeta =
      const VerificationMeta('onBasePercentage');
  @override
  late final GeneratedColumn<double> onBasePercentage = GeneratedColumn<double>(
      'OBP', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sluggingPercentageMeta =
      const VerificationMeta('sluggingPercentage');
  @override
  late final GeneratedColumn<double> sluggingPercentage =
      GeneratedColumn<double>('SLG', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _onBasePlusSluggingMeta =
      const VerificationMeta('onBasePlusSlugging');
  @override
  late final GeneratedColumn<double> onBasePlusSlugging =
      GeneratedColumn<double>('OPS', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _battingAverageOnBallsInPlayMeta =
      const VerificationMeta('battingAverageOnBallsInPlay');
  @override
  late final GeneratedColumn<double> battingAverageOnBallsInPlay =
      GeneratedColumn<double>('BABIP', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isolatedPowerMeta =
      const VerificationMeta('isolatedPower');
  @override
  late final GeneratedColumn<double> isolatedPower = GeneratedColumn<double>(
      'ISO', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _atBatsPerHomeRunMeta =
      const VerificationMeta('atBatsPerHomeRun');
  @override
  late final GeneratedColumn<double> atBatsPerHomeRun = GeneratedColumn<double>(
      'AB/HR', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _walkToStrikeoutRatioMeta =
      const VerificationMeta('walkToStrikeoutRatio');
  @override
  late final GeneratedColumn<double> walkToStrikeoutRatio =
      GeneratedColumn<double>('BB/K', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _walkPercentageMeta =
      const VerificationMeta('walkPercentage');
  @override
  late final GeneratedColumn<double> walkPercentage = GeneratedColumn<double>(
      'BB%', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _strikeoutPercentageMeta =
      const VerificationMeta('strikeoutPercentage');
  @override
  late final GeneratedColumn<double> strikeoutPercentage =
      GeneratedColumn<double>('SO%', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        playerId,
        displayOrder,
        year,
        teamId,
        games,
        plateAppearances,
        atBats,
        hits,
        extraBaseHits,
        totalBases,
        doubles,
        triples,
        homeRuns,
        runs,
        runsBattedIn,
        walks,
        intentionalWalks,
        hitByPitch,
        strikeouts,
        stolenBases,
        caughtStealing,
        sacrificeHits,
        sacrificeFlies,
        groundedIntoDoublePlays,
        battingAverage,
        onBasePercentage,
        sluggingPercentage,
        onBasePlusSlugging,
        battingAverageOnBallsInPlay,
        isolatedPower,
        atBatsPerHomeRun,
        walkToStrikeoutRatio,
        walkPercentage,
        strikeoutPercentage
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'battingStats';
  @override
  VerificationContext validateIntegrity(Insertable<BattingStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('playerId')) {
      context.handle(_playerIdMeta,
          playerId.isAcceptableOrUnknown(data['playerId']!, _playerIdMeta));
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('displayOrder')) {
      context.handle(
          _displayOrderMeta,
          displayOrder.isAcceptableOrUnknown(
              data['displayOrder']!, _displayOrderMeta));
    } else if (isInserting) {
      context.missing(_displayOrderMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('teamId')) {
      context.handle(_teamIdMeta,
          teamId.isAcceptableOrUnknown(data['teamId']!, _teamIdMeta));
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('G')) {
      context.handle(
          _gamesMeta, games.isAcceptableOrUnknown(data['G']!, _gamesMeta));
    } else if (isInserting) {
      context.missing(_gamesMeta);
    }
    if (data.containsKey('PA')) {
      context.handle(
          _plateAppearancesMeta,
          plateAppearances.isAcceptableOrUnknown(
              data['PA']!, _plateAppearancesMeta));
    } else if (isInserting) {
      context.missing(_plateAppearancesMeta);
    }
    if (data.containsKey('AB')) {
      context.handle(
          _atBatsMeta, atBats.isAcceptableOrUnknown(data['AB']!, _atBatsMeta));
    } else if (isInserting) {
      context.missing(_atBatsMeta);
    }
    if (data.containsKey('H')) {
      context.handle(
          _hitsMeta, hits.isAcceptableOrUnknown(data['H']!, _hitsMeta));
    } else if (isInserting) {
      context.missing(_hitsMeta);
    }
    if (data.containsKey('XBH')) {
      context.handle(
          _extraBaseHitsMeta,
          extraBaseHits.isAcceptableOrUnknown(
              data['XBH']!, _extraBaseHitsMeta));
    } else if (isInserting) {
      context.missing(_extraBaseHitsMeta);
    }
    if (data.containsKey('TB')) {
      context.handle(_totalBasesMeta,
          totalBases.isAcceptableOrUnknown(data['TB']!, _totalBasesMeta));
    } else if (isInserting) {
      context.missing(_totalBasesMeta);
    }
    if (data.containsKey('2B')) {
      context.handle(_doublesMeta,
          doubles.isAcceptableOrUnknown(data['2B']!, _doublesMeta));
    } else if (isInserting) {
      context.missing(_doublesMeta);
    }
    if (data.containsKey('3B')) {
      context.handle(_triplesMeta,
          triples.isAcceptableOrUnknown(data['3B']!, _triplesMeta));
    } else if (isInserting) {
      context.missing(_triplesMeta);
    }
    if (data.containsKey('HR')) {
      context.handle(_homeRunsMeta,
          homeRuns.isAcceptableOrUnknown(data['HR']!, _homeRunsMeta));
    } else if (isInserting) {
      context.missing(_homeRunsMeta);
    }
    if (data.containsKey('R')) {
      context.handle(
          _runsMeta, runs.isAcceptableOrUnknown(data['R']!, _runsMeta));
    } else if (isInserting) {
      context.missing(_runsMeta);
    }
    if (data.containsKey('RBI')) {
      context.handle(_runsBattedInMeta,
          runsBattedIn.isAcceptableOrUnknown(data['RBI']!, _runsBattedInMeta));
    } else if (isInserting) {
      context.missing(_runsBattedInMeta);
    }
    if (data.containsKey('BB')) {
      context.handle(
          _walksMeta, walks.isAcceptableOrUnknown(data['BB']!, _walksMeta));
    } else if (isInserting) {
      context.missing(_walksMeta);
    }
    if (data.containsKey('IBB')) {
      context.handle(
          _intentionalWalksMeta,
          intentionalWalks.isAcceptableOrUnknown(
              data['IBB']!, _intentionalWalksMeta));
    } else if (isInserting) {
      context.missing(_intentionalWalksMeta);
    }
    if (data.containsKey('HBP')) {
      context.handle(_hitByPitchMeta,
          hitByPitch.isAcceptableOrUnknown(data['HBP']!, _hitByPitchMeta));
    } else if (isInserting) {
      context.missing(_hitByPitchMeta);
    }
    if (data.containsKey('SO')) {
      context.handle(_strikeoutsMeta,
          strikeouts.isAcceptableOrUnknown(data['SO']!, _strikeoutsMeta));
    } else if (isInserting) {
      context.missing(_strikeoutsMeta);
    }
    if (data.containsKey('SB')) {
      context.handle(_stolenBasesMeta,
          stolenBases.isAcceptableOrUnknown(data['SB']!, _stolenBasesMeta));
    } else if (isInserting) {
      context.missing(_stolenBasesMeta);
    }
    if (data.containsKey('CS')) {
      context.handle(
          _caughtStealingMeta,
          caughtStealing.isAcceptableOrUnknown(
              data['CS']!, _caughtStealingMeta));
    } else if (isInserting) {
      context.missing(_caughtStealingMeta);
    }
    if (data.containsKey('SAC')) {
      context.handle(
          _sacrificeHitsMeta,
          sacrificeHits.isAcceptableOrUnknown(
              data['SAC']!, _sacrificeHitsMeta));
    } else if (isInserting) {
      context.missing(_sacrificeHitsMeta);
    }
    if (data.containsKey('SF')) {
      context.handle(
          _sacrificeFliesMeta,
          sacrificeFlies.isAcceptableOrUnknown(
              data['SF']!, _sacrificeFliesMeta));
    } else if (isInserting) {
      context.missing(_sacrificeFliesMeta);
    }
    if (data.containsKey('GIDP')) {
      context.handle(
          _groundedIntoDoublePlaysMeta,
          groundedIntoDoublePlays.isAcceptableOrUnknown(
              data['GIDP']!, _groundedIntoDoublePlaysMeta));
    } else if (isInserting) {
      context.missing(_groundedIntoDoublePlaysMeta);
    }
    if (data.containsKey('AVG')) {
      context.handle(
          _battingAverageMeta,
          battingAverage.isAcceptableOrUnknown(
              data['AVG']!, _battingAverageMeta));
    }
    if (data.containsKey('OBP')) {
      context.handle(
          _onBasePercentageMeta,
          onBasePercentage.isAcceptableOrUnknown(
              data['OBP']!, _onBasePercentageMeta));
    }
    if (data.containsKey('SLG')) {
      context.handle(
          _sluggingPercentageMeta,
          sluggingPercentage.isAcceptableOrUnknown(
              data['SLG']!, _sluggingPercentageMeta));
    }
    if (data.containsKey('OPS')) {
      context.handle(
          _onBasePlusSluggingMeta,
          onBasePlusSlugging.isAcceptableOrUnknown(
              data['OPS']!, _onBasePlusSluggingMeta));
    }
    if (data.containsKey('BABIP')) {
      context.handle(
          _battingAverageOnBallsInPlayMeta,
          battingAverageOnBallsInPlay.isAcceptableOrUnknown(
              data['BABIP']!, _battingAverageOnBallsInPlayMeta));
    }
    if (data.containsKey('ISO')) {
      context.handle(
          _isolatedPowerMeta,
          isolatedPower.isAcceptableOrUnknown(
              data['ISO']!, _isolatedPowerMeta));
    }
    if (data.containsKey('AB/HR')) {
      context.handle(
          _atBatsPerHomeRunMeta,
          atBatsPerHomeRun.isAcceptableOrUnknown(
              data['AB/HR']!, _atBatsPerHomeRunMeta));
    }
    if (data.containsKey('BB/K')) {
      context.handle(
          _walkToStrikeoutRatioMeta,
          walkToStrikeoutRatio.isAcceptableOrUnknown(
              data['BB/K']!, _walkToStrikeoutRatioMeta));
    }
    if (data.containsKey('BB%')) {
      context.handle(
          _walkPercentageMeta,
          walkPercentage.isAcceptableOrUnknown(
              data['BB%']!, _walkPercentageMeta));
    }
    if (data.containsKey('SO%')) {
      context.handle(
          _strikeoutPercentageMeta,
          strikeoutPercentage.isAcceptableOrUnknown(
              data['SO%']!, _strikeoutPercentageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {playerId, displayOrder};
  @override
  BattingStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BattingStat(
      playerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}playerId'])!,
      displayOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}displayOrder'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
      teamId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}teamId'])!,
      games: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}G'])!,
      plateAppearances: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}PA'])!,
      atBats: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}AB'])!,
      hits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}H'])!,
      extraBaseHits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}XBH'])!,
      totalBases: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}TB'])!,
      doubles: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}2B'])!,
      triples: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}3B'])!,
      homeRuns: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}HR'])!,
      runs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}R'])!,
      runsBattedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}RBI'])!,
      walks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}BB'])!,
      intentionalWalks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}IBB'])!,
      hitByPitch: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}HBP'])!,
      strikeouts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}SO'])!,
      stolenBases: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}SB'])!,
      caughtStealing: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}CS'])!,
      sacrificeHits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}SAC'])!,
      sacrificeFlies: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}SF'])!,
      groundedIntoDoublePlays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}GIDP'])!,
      battingAverage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}AVG']),
      onBasePercentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}OBP']),
      sluggingPercentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}SLG']),
      onBasePlusSlugging: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}OPS']),
      battingAverageOnBallsInPlay: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}BABIP']),
      isolatedPower: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ISO']),
      atBatsPerHomeRun: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}AB/HR']),
      walkToStrikeoutRatio: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}BB/K']),
      walkPercentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}BB%']),
      strikeoutPercentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}SO%']),
    );
  }

  @override
  $BattingStatsTable createAlias(String alias) {
    return $BattingStatsTable(attachedDatabase, alias);
  }
}

class BattingStat extends DataClass implements Insertable<BattingStat> {
  final String playerId;
  final int displayOrder;
  final int year;
  final String teamId;
  final int games;
  final int plateAppearances;
  final int atBats;
  final int hits;
  final int extraBaseHits;
  final int totalBases;
  final int doubles;
  final int triples;
  final int homeRuns;
  final int runs;
  final int runsBattedIn;
  final int walks;
  final int intentionalWalks;
  final int hitByPitch;
  final int strikeouts;
  final int stolenBases;
  final int caughtStealing;
  final int sacrificeHits;
  final int sacrificeFlies;
  final int groundedIntoDoublePlays;
  final double? battingAverage;
  final double? onBasePercentage;
  final double? sluggingPercentage;
  final double? onBasePlusSlugging;
  final double? battingAverageOnBallsInPlay;
  final double? isolatedPower;
  final double? atBatsPerHomeRun;
  final double? walkToStrikeoutRatio;
  final double? walkPercentage;
  final double? strikeoutPercentage;
  const BattingStat(
      {required this.playerId,
      required this.displayOrder,
      required this.year,
      required this.teamId,
      required this.games,
      required this.plateAppearances,
      required this.atBats,
      required this.hits,
      required this.extraBaseHits,
      required this.totalBases,
      required this.doubles,
      required this.triples,
      required this.homeRuns,
      required this.runs,
      required this.runsBattedIn,
      required this.walks,
      required this.intentionalWalks,
      required this.hitByPitch,
      required this.strikeouts,
      required this.stolenBases,
      required this.caughtStealing,
      required this.sacrificeHits,
      required this.sacrificeFlies,
      required this.groundedIntoDoublePlays,
      this.battingAverage,
      this.onBasePercentage,
      this.sluggingPercentage,
      this.onBasePlusSlugging,
      this.battingAverageOnBallsInPlay,
      this.isolatedPower,
      this.atBatsPerHomeRun,
      this.walkToStrikeoutRatio,
      this.walkPercentage,
      this.strikeoutPercentage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['playerId'] = Variable<String>(playerId);
    map['displayOrder'] = Variable<int>(displayOrder);
    map['year'] = Variable<int>(year);
    map['teamId'] = Variable<String>(teamId);
    map['G'] = Variable<int>(games);
    map['PA'] = Variable<int>(plateAppearances);
    map['AB'] = Variable<int>(atBats);
    map['H'] = Variable<int>(hits);
    map['XBH'] = Variable<int>(extraBaseHits);
    map['TB'] = Variable<int>(totalBases);
    map['2B'] = Variable<int>(doubles);
    map['3B'] = Variable<int>(triples);
    map['HR'] = Variable<int>(homeRuns);
    map['R'] = Variable<int>(runs);
    map['RBI'] = Variable<int>(runsBattedIn);
    map['BB'] = Variable<int>(walks);
    map['IBB'] = Variable<int>(intentionalWalks);
    map['HBP'] = Variable<int>(hitByPitch);
    map['SO'] = Variable<int>(strikeouts);
    map['SB'] = Variable<int>(stolenBases);
    map['CS'] = Variable<int>(caughtStealing);
    map['SAC'] = Variable<int>(sacrificeHits);
    map['SF'] = Variable<int>(sacrificeFlies);
    map['GIDP'] = Variable<int>(groundedIntoDoublePlays);
    if (!nullToAbsent || battingAverage != null) {
      map['AVG'] = Variable<double>(battingAverage);
    }
    if (!nullToAbsent || onBasePercentage != null) {
      map['OBP'] = Variable<double>(onBasePercentage);
    }
    if (!nullToAbsent || sluggingPercentage != null) {
      map['SLG'] = Variable<double>(sluggingPercentage);
    }
    if (!nullToAbsent || onBasePlusSlugging != null) {
      map['OPS'] = Variable<double>(onBasePlusSlugging);
    }
    if (!nullToAbsent || battingAverageOnBallsInPlay != null) {
      map['BABIP'] = Variable<double>(battingAverageOnBallsInPlay);
    }
    if (!nullToAbsent || isolatedPower != null) {
      map['ISO'] = Variable<double>(isolatedPower);
    }
    if (!nullToAbsent || atBatsPerHomeRun != null) {
      map['AB/HR'] = Variable<double>(atBatsPerHomeRun);
    }
    if (!nullToAbsent || walkToStrikeoutRatio != null) {
      map['BB/K'] = Variable<double>(walkToStrikeoutRatio);
    }
    if (!nullToAbsent || walkPercentage != null) {
      map['BB%'] = Variable<double>(walkPercentage);
    }
    if (!nullToAbsent || strikeoutPercentage != null) {
      map['SO%'] = Variable<double>(strikeoutPercentage);
    }
    return map;
  }

  BattingStatsCompanion toCompanion(bool nullToAbsent) {
    return BattingStatsCompanion(
      playerId: Value(playerId),
      displayOrder: Value(displayOrder),
      year: Value(year),
      teamId: Value(teamId),
      games: Value(games),
      plateAppearances: Value(plateAppearances),
      atBats: Value(atBats),
      hits: Value(hits),
      extraBaseHits: Value(extraBaseHits),
      totalBases: Value(totalBases),
      doubles: Value(doubles),
      triples: Value(triples),
      homeRuns: Value(homeRuns),
      runs: Value(runs),
      runsBattedIn: Value(runsBattedIn),
      walks: Value(walks),
      intentionalWalks: Value(intentionalWalks),
      hitByPitch: Value(hitByPitch),
      strikeouts: Value(strikeouts),
      stolenBases: Value(stolenBases),
      caughtStealing: Value(caughtStealing),
      sacrificeHits: Value(sacrificeHits),
      sacrificeFlies: Value(sacrificeFlies),
      groundedIntoDoublePlays: Value(groundedIntoDoublePlays),
      battingAverage: battingAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(battingAverage),
      onBasePercentage: onBasePercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(onBasePercentage),
      sluggingPercentage: sluggingPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(sluggingPercentage),
      onBasePlusSlugging: onBasePlusSlugging == null && nullToAbsent
          ? const Value.absent()
          : Value(onBasePlusSlugging),
      battingAverageOnBallsInPlay:
          battingAverageOnBallsInPlay == null && nullToAbsent
              ? const Value.absent()
              : Value(battingAverageOnBallsInPlay),
      isolatedPower: isolatedPower == null && nullToAbsent
          ? const Value.absent()
          : Value(isolatedPower),
      atBatsPerHomeRun: atBatsPerHomeRun == null && nullToAbsent
          ? const Value.absent()
          : Value(atBatsPerHomeRun),
      walkToStrikeoutRatio: walkToStrikeoutRatio == null && nullToAbsent
          ? const Value.absent()
          : Value(walkToStrikeoutRatio),
      walkPercentage: walkPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(walkPercentage),
      strikeoutPercentage: strikeoutPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(strikeoutPercentage),
    );
  }

  factory BattingStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BattingStat(
      playerId: serializer.fromJson<String>(json['playerId']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      year: serializer.fromJson<int>(json['year']),
      teamId: serializer.fromJson<String>(json['teamId']),
      games: serializer.fromJson<int>(json['games']),
      plateAppearances: serializer.fromJson<int>(json['plateAppearances']),
      atBats: serializer.fromJson<int>(json['atBats']),
      hits: serializer.fromJson<int>(json['hits']),
      extraBaseHits: serializer.fromJson<int>(json['extraBaseHits']),
      totalBases: serializer.fromJson<int>(json['totalBases']),
      doubles: serializer.fromJson<int>(json['doubles']),
      triples: serializer.fromJson<int>(json['triples']),
      homeRuns: serializer.fromJson<int>(json['homeRuns']),
      runs: serializer.fromJson<int>(json['runs']),
      runsBattedIn: serializer.fromJson<int>(json['runsBattedIn']),
      walks: serializer.fromJson<int>(json['walks']),
      intentionalWalks: serializer.fromJson<int>(json['intentionalWalks']),
      hitByPitch: serializer.fromJson<int>(json['hitByPitch']),
      strikeouts: serializer.fromJson<int>(json['strikeouts']),
      stolenBases: serializer.fromJson<int>(json['stolenBases']),
      caughtStealing: serializer.fromJson<int>(json['caughtStealing']),
      sacrificeHits: serializer.fromJson<int>(json['sacrificeHits']),
      sacrificeFlies: serializer.fromJson<int>(json['sacrificeFlies']),
      groundedIntoDoublePlays:
          serializer.fromJson<int>(json['groundedIntoDoublePlays']),
      battingAverage: serializer.fromJson<double?>(json['battingAverage']),
      onBasePercentage: serializer.fromJson<double?>(json['onBasePercentage']),
      sluggingPercentage:
          serializer.fromJson<double?>(json['sluggingPercentage']),
      onBasePlusSlugging:
          serializer.fromJson<double?>(json['onBasePlusSlugging']),
      battingAverageOnBallsInPlay:
          serializer.fromJson<double?>(json['battingAverageOnBallsInPlay']),
      isolatedPower: serializer.fromJson<double?>(json['isolatedPower']),
      atBatsPerHomeRun: serializer.fromJson<double?>(json['atBatsPerHomeRun']),
      walkToStrikeoutRatio:
          serializer.fromJson<double?>(json['walkToStrikeoutRatio']),
      walkPercentage: serializer.fromJson<double?>(json['walkPercentage']),
      strikeoutPercentage:
          serializer.fromJson<double?>(json['strikeoutPercentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playerId': serializer.toJson<String>(playerId),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'year': serializer.toJson<int>(year),
      'teamId': serializer.toJson<String>(teamId),
      'games': serializer.toJson<int>(games),
      'plateAppearances': serializer.toJson<int>(plateAppearances),
      'atBats': serializer.toJson<int>(atBats),
      'hits': serializer.toJson<int>(hits),
      'extraBaseHits': serializer.toJson<int>(extraBaseHits),
      'totalBases': serializer.toJson<int>(totalBases),
      'doubles': serializer.toJson<int>(doubles),
      'triples': serializer.toJson<int>(triples),
      'homeRuns': serializer.toJson<int>(homeRuns),
      'runs': serializer.toJson<int>(runs),
      'runsBattedIn': serializer.toJson<int>(runsBattedIn),
      'walks': serializer.toJson<int>(walks),
      'intentionalWalks': serializer.toJson<int>(intentionalWalks),
      'hitByPitch': serializer.toJson<int>(hitByPitch),
      'strikeouts': serializer.toJson<int>(strikeouts),
      'stolenBases': serializer.toJson<int>(stolenBases),
      'caughtStealing': serializer.toJson<int>(caughtStealing),
      'sacrificeHits': serializer.toJson<int>(sacrificeHits),
      'sacrificeFlies': serializer.toJson<int>(sacrificeFlies),
      'groundedIntoDoublePlays':
          serializer.toJson<int>(groundedIntoDoublePlays),
      'battingAverage': serializer.toJson<double?>(battingAverage),
      'onBasePercentage': serializer.toJson<double?>(onBasePercentage),
      'sluggingPercentage': serializer.toJson<double?>(sluggingPercentage),
      'onBasePlusSlugging': serializer.toJson<double?>(onBasePlusSlugging),
      'battingAverageOnBallsInPlay':
          serializer.toJson<double?>(battingAverageOnBallsInPlay),
      'isolatedPower': serializer.toJson<double?>(isolatedPower),
      'atBatsPerHomeRun': serializer.toJson<double?>(atBatsPerHomeRun),
      'walkToStrikeoutRatio': serializer.toJson<double?>(walkToStrikeoutRatio),
      'walkPercentage': serializer.toJson<double?>(walkPercentage),
      'strikeoutPercentage': serializer.toJson<double?>(strikeoutPercentage),
    };
  }

  BattingStat copyWith(
          {String? playerId,
          int? displayOrder,
          int? year,
          String? teamId,
          int? games,
          int? plateAppearances,
          int? atBats,
          int? hits,
          int? extraBaseHits,
          int? totalBases,
          int? doubles,
          int? triples,
          int? homeRuns,
          int? runs,
          int? runsBattedIn,
          int? walks,
          int? intentionalWalks,
          int? hitByPitch,
          int? strikeouts,
          int? stolenBases,
          int? caughtStealing,
          int? sacrificeHits,
          int? sacrificeFlies,
          int? groundedIntoDoublePlays,
          Value<double?> battingAverage = const Value.absent(),
          Value<double?> onBasePercentage = const Value.absent(),
          Value<double?> sluggingPercentage = const Value.absent(),
          Value<double?> onBasePlusSlugging = const Value.absent(),
          Value<double?> battingAverageOnBallsInPlay = const Value.absent(),
          Value<double?> isolatedPower = const Value.absent(),
          Value<double?> atBatsPerHomeRun = const Value.absent(),
          Value<double?> walkToStrikeoutRatio = const Value.absent(),
          Value<double?> walkPercentage = const Value.absent(),
          Value<double?> strikeoutPercentage = const Value.absent()}) =>
      BattingStat(
        playerId: playerId ?? this.playerId,
        displayOrder: displayOrder ?? this.displayOrder,
        year: year ?? this.year,
        teamId: teamId ?? this.teamId,
        games: games ?? this.games,
        plateAppearances: plateAppearances ?? this.plateAppearances,
        atBats: atBats ?? this.atBats,
        hits: hits ?? this.hits,
        extraBaseHits: extraBaseHits ?? this.extraBaseHits,
        totalBases: totalBases ?? this.totalBases,
        doubles: doubles ?? this.doubles,
        triples: triples ?? this.triples,
        homeRuns: homeRuns ?? this.homeRuns,
        runs: runs ?? this.runs,
        runsBattedIn: runsBattedIn ?? this.runsBattedIn,
        walks: walks ?? this.walks,
        intentionalWalks: intentionalWalks ?? this.intentionalWalks,
        hitByPitch: hitByPitch ?? this.hitByPitch,
        strikeouts: strikeouts ?? this.strikeouts,
        stolenBases: stolenBases ?? this.stolenBases,
        caughtStealing: caughtStealing ?? this.caughtStealing,
        sacrificeHits: sacrificeHits ?? this.sacrificeHits,
        sacrificeFlies: sacrificeFlies ?? this.sacrificeFlies,
        groundedIntoDoublePlays:
            groundedIntoDoublePlays ?? this.groundedIntoDoublePlays,
        battingAverage:
            battingAverage.present ? battingAverage.value : this.battingAverage,
        onBasePercentage: onBasePercentage.present
            ? onBasePercentage.value
            : this.onBasePercentage,
        sluggingPercentage: sluggingPercentage.present
            ? sluggingPercentage.value
            : this.sluggingPercentage,
        onBasePlusSlugging: onBasePlusSlugging.present
            ? onBasePlusSlugging.value
            : this.onBasePlusSlugging,
        battingAverageOnBallsInPlay: battingAverageOnBallsInPlay.present
            ? battingAverageOnBallsInPlay.value
            : this.battingAverageOnBallsInPlay,
        isolatedPower:
            isolatedPower.present ? isolatedPower.value : this.isolatedPower,
        atBatsPerHomeRun: atBatsPerHomeRun.present
            ? atBatsPerHomeRun.value
            : this.atBatsPerHomeRun,
        walkToStrikeoutRatio: walkToStrikeoutRatio.present
            ? walkToStrikeoutRatio.value
            : this.walkToStrikeoutRatio,
        walkPercentage:
            walkPercentage.present ? walkPercentage.value : this.walkPercentage,
        strikeoutPercentage: strikeoutPercentage.present
            ? strikeoutPercentage.value
            : this.strikeoutPercentage,
      );
  BattingStat copyWithCompanion(BattingStatsCompanion data) {
    return BattingStat(
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      year: data.year.present ? data.year.value : this.year,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
      games: data.games.present ? data.games.value : this.games,
      plateAppearances: data.plateAppearances.present
          ? data.plateAppearances.value
          : this.plateAppearances,
      atBats: data.atBats.present ? data.atBats.value : this.atBats,
      hits: data.hits.present ? data.hits.value : this.hits,
      extraBaseHits: data.extraBaseHits.present
          ? data.extraBaseHits.value
          : this.extraBaseHits,
      totalBases:
          data.totalBases.present ? data.totalBases.value : this.totalBases,
      doubles: data.doubles.present ? data.doubles.value : this.doubles,
      triples: data.triples.present ? data.triples.value : this.triples,
      homeRuns: data.homeRuns.present ? data.homeRuns.value : this.homeRuns,
      runs: data.runs.present ? data.runs.value : this.runs,
      runsBattedIn: data.runsBattedIn.present
          ? data.runsBattedIn.value
          : this.runsBattedIn,
      walks: data.walks.present ? data.walks.value : this.walks,
      intentionalWalks: data.intentionalWalks.present
          ? data.intentionalWalks.value
          : this.intentionalWalks,
      hitByPitch:
          data.hitByPitch.present ? data.hitByPitch.value : this.hitByPitch,
      strikeouts:
          data.strikeouts.present ? data.strikeouts.value : this.strikeouts,
      stolenBases:
          data.stolenBases.present ? data.stolenBases.value : this.stolenBases,
      caughtStealing: data.caughtStealing.present
          ? data.caughtStealing.value
          : this.caughtStealing,
      sacrificeHits: data.sacrificeHits.present
          ? data.sacrificeHits.value
          : this.sacrificeHits,
      sacrificeFlies: data.sacrificeFlies.present
          ? data.sacrificeFlies.value
          : this.sacrificeFlies,
      groundedIntoDoublePlays: data.groundedIntoDoublePlays.present
          ? data.groundedIntoDoublePlays.value
          : this.groundedIntoDoublePlays,
      battingAverage: data.battingAverage.present
          ? data.battingAverage.value
          : this.battingAverage,
      onBasePercentage: data.onBasePercentage.present
          ? data.onBasePercentage.value
          : this.onBasePercentage,
      sluggingPercentage: data.sluggingPercentage.present
          ? data.sluggingPercentage.value
          : this.sluggingPercentage,
      onBasePlusSlugging: data.onBasePlusSlugging.present
          ? data.onBasePlusSlugging.value
          : this.onBasePlusSlugging,
      battingAverageOnBallsInPlay: data.battingAverageOnBallsInPlay.present
          ? data.battingAverageOnBallsInPlay.value
          : this.battingAverageOnBallsInPlay,
      isolatedPower: data.isolatedPower.present
          ? data.isolatedPower.value
          : this.isolatedPower,
      atBatsPerHomeRun: data.atBatsPerHomeRun.present
          ? data.atBatsPerHomeRun.value
          : this.atBatsPerHomeRun,
      walkToStrikeoutRatio: data.walkToStrikeoutRatio.present
          ? data.walkToStrikeoutRatio.value
          : this.walkToStrikeoutRatio,
      walkPercentage: data.walkPercentage.present
          ? data.walkPercentage.value
          : this.walkPercentage,
      strikeoutPercentage: data.strikeoutPercentage.present
          ? data.strikeoutPercentage.value
          : this.strikeoutPercentage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BattingStat(')
          ..write('playerId: $playerId, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('year: $year, ')
          ..write('teamId: $teamId, ')
          ..write('games: $games, ')
          ..write('plateAppearances: $plateAppearances, ')
          ..write('atBats: $atBats, ')
          ..write('hits: $hits, ')
          ..write('extraBaseHits: $extraBaseHits, ')
          ..write('totalBases: $totalBases, ')
          ..write('doubles: $doubles, ')
          ..write('triples: $triples, ')
          ..write('homeRuns: $homeRuns, ')
          ..write('runs: $runs, ')
          ..write('runsBattedIn: $runsBattedIn, ')
          ..write('walks: $walks, ')
          ..write('intentionalWalks: $intentionalWalks, ')
          ..write('hitByPitch: $hitByPitch, ')
          ..write('strikeouts: $strikeouts, ')
          ..write('stolenBases: $stolenBases, ')
          ..write('caughtStealing: $caughtStealing, ')
          ..write('sacrificeHits: $sacrificeHits, ')
          ..write('sacrificeFlies: $sacrificeFlies, ')
          ..write('groundedIntoDoublePlays: $groundedIntoDoublePlays, ')
          ..write('battingAverage: $battingAverage, ')
          ..write('onBasePercentage: $onBasePercentage, ')
          ..write('sluggingPercentage: $sluggingPercentage, ')
          ..write('onBasePlusSlugging: $onBasePlusSlugging, ')
          ..write('battingAverageOnBallsInPlay: $battingAverageOnBallsInPlay, ')
          ..write('isolatedPower: $isolatedPower, ')
          ..write('atBatsPerHomeRun: $atBatsPerHomeRun, ')
          ..write('walkToStrikeoutRatio: $walkToStrikeoutRatio, ')
          ..write('walkPercentage: $walkPercentage, ')
          ..write('strikeoutPercentage: $strikeoutPercentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        playerId,
        displayOrder,
        year,
        teamId,
        games,
        plateAppearances,
        atBats,
        hits,
        extraBaseHits,
        totalBases,
        doubles,
        triples,
        homeRuns,
        runs,
        runsBattedIn,
        walks,
        intentionalWalks,
        hitByPitch,
        strikeouts,
        stolenBases,
        caughtStealing,
        sacrificeHits,
        sacrificeFlies,
        groundedIntoDoublePlays,
        battingAverage,
        onBasePercentage,
        sluggingPercentage,
        onBasePlusSlugging,
        battingAverageOnBallsInPlay,
        isolatedPower,
        atBatsPerHomeRun,
        walkToStrikeoutRatio,
        walkPercentage,
        strikeoutPercentage
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BattingStat &&
          other.playerId == this.playerId &&
          other.displayOrder == this.displayOrder &&
          other.year == this.year &&
          other.teamId == this.teamId &&
          other.games == this.games &&
          other.plateAppearances == this.plateAppearances &&
          other.atBats == this.atBats &&
          other.hits == this.hits &&
          other.extraBaseHits == this.extraBaseHits &&
          other.totalBases == this.totalBases &&
          other.doubles == this.doubles &&
          other.triples == this.triples &&
          other.homeRuns == this.homeRuns &&
          other.runs == this.runs &&
          other.runsBattedIn == this.runsBattedIn &&
          other.walks == this.walks &&
          other.intentionalWalks == this.intentionalWalks &&
          other.hitByPitch == this.hitByPitch &&
          other.strikeouts == this.strikeouts &&
          other.stolenBases == this.stolenBases &&
          other.caughtStealing == this.caughtStealing &&
          other.sacrificeHits == this.sacrificeHits &&
          other.sacrificeFlies == this.sacrificeFlies &&
          other.groundedIntoDoublePlays == this.groundedIntoDoublePlays &&
          other.battingAverage == this.battingAverage &&
          other.onBasePercentage == this.onBasePercentage &&
          other.sluggingPercentage == this.sluggingPercentage &&
          other.onBasePlusSlugging == this.onBasePlusSlugging &&
          other.battingAverageOnBallsInPlay ==
              this.battingAverageOnBallsInPlay &&
          other.isolatedPower == this.isolatedPower &&
          other.atBatsPerHomeRun == this.atBatsPerHomeRun &&
          other.walkToStrikeoutRatio == this.walkToStrikeoutRatio &&
          other.walkPercentage == this.walkPercentage &&
          other.strikeoutPercentage == this.strikeoutPercentage);
}

class BattingStatsCompanion extends UpdateCompanion<BattingStat> {
  final Value<String> playerId;
  final Value<int> displayOrder;
  final Value<int> year;
  final Value<String> teamId;
  final Value<int> games;
  final Value<int> plateAppearances;
  final Value<int> atBats;
  final Value<int> hits;
  final Value<int> extraBaseHits;
  final Value<int> totalBases;
  final Value<int> doubles;
  final Value<int> triples;
  final Value<int> homeRuns;
  final Value<int> runs;
  final Value<int> runsBattedIn;
  final Value<int> walks;
  final Value<int> intentionalWalks;
  final Value<int> hitByPitch;
  final Value<int> strikeouts;
  final Value<int> stolenBases;
  final Value<int> caughtStealing;
  final Value<int> sacrificeHits;
  final Value<int> sacrificeFlies;
  final Value<int> groundedIntoDoublePlays;
  final Value<double?> battingAverage;
  final Value<double?> onBasePercentage;
  final Value<double?> sluggingPercentage;
  final Value<double?> onBasePlusSlugging;
  final Value<double?> battingAverageOnBallsInPlay;
  final Value<double?> isolatedPower;
  final Value<double?> atBatsPerHomeRun;
  final Value<double?> walkToStrikeoutRatio;
  final Value<double?> walkPercentage;
  final Value<double?> strikeoutPercentage;
  final Value<int> rowid;
  const BattingStatsCompanion({
    this.playerId = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.year = const Value.absent(),
    this.teamId = const Value.absent(),
    this.games = const Value.absent(),
    this.plateAppearances = const Value.absent(),
    this.atBats = const Value.absent(),
    this.hits = const Value.absent(),
    this.extraBaseHits = const Value.absent(),
    this.totalBases = const Value.absent(),
    this.doubles = const Value.absent(),
    this.triples = const Value.absent(),
    this.homeRuns = const Value.absent(),
    this.runs = const Value.absent(),
    this.runsBattedIn = const Value.absent(),
    this.walks = const Value.absent(),
    this.intentionalWalks = const Value.absent(),
    this.hitByPitch = const Value.absent(),
    this.strikeouts = const Value.absent(),
    this.stolenBases = const Value.absent(),
    this.caughtStealing = const Value.absent(),
    this.sacrificeHits = const Value.absent(),
    this.sacrificeFlies = const Value.absent(),
    this.groundedIntoDoublePlays = const Value.absent(),
    this.battingAverage = const Value.absent(),
    this.onBasePercentage = const Value.absent(),
    this.sluggingPercentage = const Value.absent(),
    this.onBasePlusSlugging = const Value.absent(),
    this.battingAverageOnBallsInPlay = const Value.absent(),
    this.isolatedPower = const Value.absent(),
    this.atBatsPerHomeRun = const Value.absent(),
    this.walkToStrikeoutRatio = const Value.absent(),
    this.walkPercentage = const Value.absent(),
    this.strikeoutPercentage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BattingStatsCompanion.insert({
    required String playerId,
    required int displayOrder,
    required int year,
    required String teamId,
    required int games,
    required int plateAppearances,
    required int atBats,
    required int hits,
    required int extraBaseHits,
    required int totalBases,
    required int doubles,
    required int triples,
    required int homeRuns,
    required int runs,
    required int runsBattedIn,
    required int walks,
    required int intentionalWalks,
    required int hitByPitch,
    required int strikeouts,
    required int stolenBases,
    required int caughtStealing,
    required int sacrificeHits,
    required int sacrificeFlies,
    required int groundedIntoDoublePlays,
    this.battingAverage = const Value.absent(),
    this.onBasePercentage = const Value.absent(),
    this.sluggingPercentage = const Value.absent(),
    this.onBasePlusSlugging = const Value.absent(),
    this.battingAverageOnBallsInPlay = const Value.absent(),
    this.isolatedPower = const Value.absent(),
    this.atBatsPerHomeRun = const Value.absent(),
    this.walkToStrikeoutRatio = const Value.absent(),
    this.walkPercentage = const Value.absent(),
    this.strikeoutPercentage = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : playerId = Value(playerId),
        displayOrder = Value(displayOrder),
        year = Value(year),
        teamId = Value(teamId),
        games = Value(games),
        plateAppearances = Value(plateAppearances),
        atBats = Value(atBats),
        hits = Value(hits),
        extraBaseHits = Value(extraBaseHits),
        totalBases = Value(totalBases),
        doubles = Value(doubles),
        triples = Value(triples),
        homeRuns = Value(homeRuns),
        runs = Value(runs),
        runsBattedIn = Value(runsBattedIn),
        walks = Value(walks),
        intentionalWalks = Value(intentionalWalks),
        hitByPitch = Value(hitByPitch),
        strikeouts = Value(strikeouts),
        stolenBases = Value(stolenBases),
        caughtStealing = Value(caughtStealing),
        sacrificeHits = Value(sacrificeHits),
        sacrificeFlies = Value(sacrificeFlies),
        groundedIntoDoublePlays = Value(groundedIntoDoublePlays);
  static Insertable<BattingStat> custom({
    Expression<String>? playerId,
    Expression<int>? displayOrder,
    Expression<int>? year,
    Expression<String>? teamId,
    Expression<int>? games,
    Expression<int>? plateAppearances,
    Expression<int>? atBats,
    Expression<int>? hits,
    Expression<int>? extraBaseHits,
    Expression<int>? totalBases,
    Expression<int>? doubles,
    Expression<int>? triples,
    Expression<int>? homeRuns,
    Expression<int>? runs,
    Expression<int>? runsBattedIn,
    Expression<int>? walks,
    Expression<int>? intentionalWalks,
    Expression<int>? hitByPitch,
    Expression<int>? strikeouts,
    Expression<int>? stolenBases,
    Expression<int>? caughtStealing,
    Expression<int>? sacrificeHits,
    Expression<int>? sacrificeFlies,
    Expression<int>? groundedIntoDoublePlays,
    Expression<double>? battingAverage,
    Expression<double>? onBasePercentage,
    Expression<double>? sluggingPercentage,
    Expression<double>? onBasePlusSlugging,
    Expression<double>? battingAverageOnBallsInPlay,
    Expression<double>? isolatedPower,
    Expression<double>? atBatsPerHomeRun,
    Expression<double>? walkToStrikeoutRatio,
    Expression<double>? walkPercentage,
    Expression<double>? strikeoutPercentage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (playerId != null) 'playerId': playerId,
      if (displayOrder != null) 'displayOrder': displayOrder,
      if (year != null) 'year': year,
      if (teamId != null) 'teamId': teamId,
      if (games != null) 'G': games,
      if (plateAppearances != null) 'PA': plateAppearances,
      if (atBats != null) 'AB': atBats,
      if (hits != null) 'H': hits,
      if (extraBaseHits != null) 'XBH': extraBaseHits,
      if (totalBases != null) 'TB': totalBases,
      if (doubles != null) '2B': doubles,
      if (triples != null) '3B': triples,
      if (homeRuns != null) 'HR': homeRuns,
      if (runs != null) 'R': runs,
      if (runsBattedIn != null) 'RBI': runsBattedIn,
      if (walks != null) 'BB': walks,
      if (intentionalWalks != null) 'IBB': intentionalWalks,
      if (hitByPitch != null) 'HBP': hitByPitch,
      if (strikeouts != null) 'SO': strikeouts,
      if (stolenBases != null) 'SB': stolenBases,
      if (caughtStealing != null) 'CS': caughtStealing,
      if (sacrificeHits != null) 'SAC': sacrificeHits,
      if (sacrificeFlies != null) 'SF': sacrificeFlies,
      if (groundedIntoDoublePlays != null) 'GIDP': groundedIntoDoublePlays,
      if (battingAverage != null) 'AVG': battingAverage,
      if (onBasePercentage != null) 'OBP': onBasePercentage,
      if (sluggingPercentage != null) 'SLG': sluggingPercentage,
      if (onBasePlusSlugging != null) 'OPS': onBasePlusSlugging,
      if (battingAverageOnBallsInPlay != null)
        'BABIP': battingAverageOnBallsInPlay,
      if (isolatedPower != null) 'ISO': isolatedPower,
      if (atBatsPerHomeRun != null) 'AB/HR': atBatsPerHomeRun,
      if (walkToStrikeoutRatio != null) 'BB/K': walkToStrikeoutRatio,
      if (walkPercentage != null) 'BB%': walkPercentage,
      if (strikeoutPercentage != null) 'SO%': strikeoutPercentage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BattingStatsCompanion copyWith(
      {Value<String>? playerId,
      Value<int>? displayOrder,
      Value<int>? year,
      Value<String>? teamId,
      Value<int>? games,
      Value<int>? plateAppearances,
      Value<int>? atBats,
      Value<int>? hits,
      Value<int>? extraBaseHits,
      Value<int>? totalBases,
      Value<int>? doubles,
      Value<int>? triples,
      Value<int>? homeRuns,
      Value<int>? runs,
      Value<int>? runsBattedIn,
      Value<int>? walks,
      Value<int>? intentionalWalks,
      Value<int>? hitByPitch,
      Value<int>? strikeouts,
      Value<int>? stolenBases,
      Value<int>? caughtStealing,
      Value<int>? sacrificeHits,
      Value<int>? sacrificeFlies,
      Value<int>? groundedIntoDoublePlays,
      Value<double?>? battingAverage,
      Value<double?>? onBasePercentage,
      Value<double?>? sluggingPercentage,
      Value<double?>? onBasePlusSlugging,
      Value<double?>? battingAverageOnBallsInPlay,
      Value<double?>? isolatedPower,
      Value<double?>? atBatsPerHomeRun,
      Value<double?>? walkToStrikeoutRatio,
      Value<double?>? walkPercentage,
      Value<double?>? strikeoutPercentage,
      Value<int>? rowid}) {
    return BattingStatsCompanion(
      playerId: playerId ?? this.playerId,
      displayOrder: displayOrder ?? this.displayOrder,
      year: year ?? this.year,
      teamId: teamId ?? this.teamId,
      games: games ?? this.games,
      plateAppearances: plateAppearances ?? this.plateAppearances,
      atBats: atBats ?? this.atBats,
      hits: hits ?? this.hits,
      extraBaseHits: extraBaseHits ?? this.extraBaseHits,
      totalBases: totalBases ?? this.totalBases,
      doubles: doubles ?? this.doubles,
      triples: triples ?? this.triples,
      homeRuns: homeRuns ?? this.homeRuns,
      runs: runs ?? this.runs,
      runsBattedIn: runsBattedIn ?? this.runsBattedIn,
      walks: walks ?? this.walks,
      intentionalWalks: intentionalWalks ?? this.intentionalWalks,
      hitByPitch: hitByPitch ?? this.hitByPitch,
      strikeouts: strikeouts ?? this.strikeouts,
      stolenBases: stolenBases ?? this.stolenBases,
      caughtStealing: caughtStealing ?? this.caughtStealing,
      sacrificeHits: sacrificeHits ?? this.sacrificeHits,
      sacrificeFlies: sacrificeFlies ?? this.sacrificeFlies,
      groundedIntoDoublePlays:
          groundedIntoDoublePlays ?? this.groundedIntoDoublePlays,
      battingAverage: battingAverage ?? this.battingAverage,
      onBasePercentage: onBasePercentage ?? this.onBasePercentage,
      sluggingPercentage: sluggingPercentage ?? this.sluggingPercentage,
      onBasePlusSlugging: onBasePlusSlugging ?? this.onBasePlusSlugging,
      battingAverageOnBallsInPlay:
          battingAverageOnBallsInPlay ?? this.battingAverageOnBallsInPlay,
      isolatedPower: isolatedPower ?? this.isolatedPower,
      atBatsPerHomeRun: atBatsPerHomeRun ?? this.atBatsPerHomeRun,
      walkToStrikeoutRatio: walkToStrikeoutRatio ?? this.walkToStrikeoutRatio,
      walkPercentage: walkPercentage ?? this.walkPercentage,
      strikeoutPercentage: strikeoutPercentage ?? this.strikeoutPercentage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playerId.present) {
      map['playerId'] = Variable<String>(playerId.value);
    }
    if (displayOrder.present) {
      map['displayOrder'] = Variable<int>(displayOrder.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (teamId.present) {
      map['teamId'] = Variable<String>(teamId.value);
    }
    if (games.present) {
      map['G'] = Variable<int>(games.value);
    }
    if (plateAppearances.present) {
      map['PA'] = Variable<int>(plateAppearances.value);
    }
    if (atBats.present) {
      map['AB'] = Variable<int>(atBats.value);
    }
    if (hits.present) {
      map['H'] = Variable<int>(hits.value);
    }
    if (extraBaseHits.present) {
      map['XBH'] = Variable<int>(extraBaseHits.value);
    }
    if (totalBases.present) {
      map['TB'] = Variable<int>(totalBases.value);
    }
    if (doubles.present) {
      map['2B'] = Variable<int>(doubles.value);
    }
    if (triples.present) {
      map['3B'] = Variable<int>(triples.value);
    }
    if (homeRuns.present) {
      map['HR'] = Variable<int>(homeRuns.value);
    }
    if (runs.present) {
      map['R'] = Variable<int>(runs.value);
    }
    if (runsBattedIn.present) {
      map['RBI'] = Variable<int>(runsBattedIn.value);
    }
    if (walks.present) {
      map['BB'] = Variable<int>(walks.value);
    }
    if (intentionalWalks.present) {
      map['IBB'] = Variable<int>(intentionalWalks.value);
    }
    if (hitByPitch.present) {
      map['HBP'] = Variable<int>(hitByPitch.value);
    }
    if (strikeouts.present) {
      map['SO'] = Variable<int>(strikeouts.value);
    }
    if (stolenBases.present) {
      map['SB'] = Variable<int>(stolenBases.value);
    }
    if (caughtStealing.present) {
      map['CS'] = Variable<int>(caughtStealing.value);
    }
    if (sacrificeHits.present) {
      map['SAC'] = Variable<int>(sacrificeHits.value);
    }
    if (sacrificeFlies.present) {
      map['SF'] = Variable<int>(sacrificeFlies.value);
    }
    if (groundedIntoDoublePlays.present) {
      map['GIDP'] = Variable<int>(groundedIntoDoublePlays.value);
    }
    if (battingAverage.present) {
      map['AVG'] = Variable<double>(battingAverage.value);
    }
    if (onBasePercentage.present) {
      map['OBP'] = Variable<double>(onBasePercentage.value);
    }
    if (sluggingPercentage.present) {
      map['SLG'] = Variable<double>(sluggingPercentage.value);
    }
    if (onBasePlusSlugging.present) {
      map['OPS'] = Variable<double>(onBasePlusSlugging.value);
    }
    if (battingAverageOnBallsInPlay.present) {
      map['BABIP'] = Variable<double>(battingAverageOnBallsInPlay.value);
    }
    if (isolatedPower.present) {
      map['ISO'] = Variable<double>(isolatedPower.value);
    }
    if (atBatsPerHomeRun.present) {
      map['AB/HR'] = Variable<double>(atBatsPerHomeRun.value);
    }
    if (walkToStrikeoutRatio.present) {
      map['BB/K'] = Variable<double>(walkToStrikeoutRatio.value);
    }
    if (walkPercentage.present) {
      map['BB%'] = Variable<double>(walkPercentage.value);
    }
    if (strikeoutPercentage.present) {
      map['SO%'] = Variable<double>(strikeoutPercentage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BattingStatsCompanion(')
          ..write('playerId: $playerId, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('year: $year, ')
          ..write('teamId: $teamId, ')
          ..write('games: $games, ')
          ..write('plateAppearances: $plateAppearances, ')
          ..write('atBats: $atBats, ')
          ..write('hits: $hits, ')
          ..write('extraBaseHits: $extraBaseHits, ')
          ..write('totalBases: $totalBases, ')
          ..write('doubles: $doubles, ')
          ..write('triples: $triples, ')
          ..write('homeRuns: $homeRuns, ')
          ..write('runs: $runs, ')
          ..write('runsBattedIn: $runsBattedIn, ')
          ..write('walks: $walks, ')
          ..write('intentionalWalks: $intentionalWalks, ')
          ..write('hitByPitch: $hitByPitch, ')
          ..write('strikeouts: $strikeouts, ')
          ..write('stolenBases: $stolenBases, ')
          ..write('caughtStealing: $caughtStealing, ')
          ..write('sacrificeHits: $sacrificeHits, ')
          ..write('sacrificeFlies: $sacrificeFlies, ')
          ..write('groundedIntoDoublePlays: $groundedIntoDoublePlays, ')
          ..write('battingAverage: $battingAverage, ')
          ..write('onBasePercentage: $onBasePercentage, ')
          ..write('sluggingPercentage: $sluggingPercentage, ')
          ..write('onBasePlusSlugging: $onBasePlusSlugging, ')
          ..write('battingAverageOnBallsInPlay: $battingAverageOnBallsInPlay, ')
          ..write('isolatedPower: $isolatedPower, ')
          ..write('atBatsPerHomeRun: $atBatsPerHomeRun, ')
          ..write('walkToStrikeoutRatio: $walkToStrikeoutRatio, ')
          ..write('walkPercentage: $walkPercentage, ')
          ..write('strikeoutPercentage: $strikeoutPercentage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDriftDatabase extends GeneratedDatabase {
  _$MyDriftDatabase(QueryExecutor e) : super(e);
  $MyDriftDatabaseManager get managers => $MyDriftDatabaseManager(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final $BattingStatsTable battingStats = $BattingStatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [players, battingStats];
}

typedef $$PlayersTableCreateCompanionBuilder = PlayersCompanion Function({
  required String playerId,
  Value<String?> nameFirst,
  required String nameLast,
  Value<int> rowid,
});
typedef $$PlayersTableUpdateCompanionBuilder = PlayersCompanion Function({
  Value<String> playerId,
  Value<String?> nameFirst,
  Value<String> nameLast,
  Value<int> rowid,
});

class $$PlayersTableTableManager extends RootTableManager<
    _$MyDriftDatabase,
    $PlayersTable,
    Player,
    $$PlayersTableFilterComposer,
    $$PlayersTableOrderingComposer,
    $$PlayersTableCreateCompanionBuilder,
    $$PlayersTableUpdateCompanionBuilder> {
  $$PlayersTableTableManager(_$MyDriftDatabase db, $PlayersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PlayersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PlayersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> playerId = const Value.absent(),
            Value<String?> nameFirst = const Value.absent(),
            Value<String> nameLast = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlayersCompanion(
            playerId: playerId,
            nameFirst: nameFirst,
            nameLast: nameLast,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String playerId,
            Value<String?> nameFirst = const Value.absent(),
            required String nameLast,
            Value<int> rowid = const Value.absent(),
          }) =>
              PlayersCompanion.insert(
            playerId: playerId,
            nameFirst: nameFirst,
            nameLast: nameLast,
            rowid: rowid,
          ),
        ));
}

class $$PlayersTableFilterComposer
    extends FilterComposer<_$MyDriftDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer(super.$state);
  ColumnFilters<String> get playerId => $state.composableBuilder(
      column: $state.table.playerId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameFirst => $state.composableBuilder(
      column: $state.table.nameFirst,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameLast => $state.composableBuilder(
      column: $state.table.nameLast,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PlayersTableOrderingComposer
    extends OrderingComposer<_$MyDriftDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer(super.$state);
  ColumnOrderings<String> get playerId => $state.composableBuilder(
      column: $state.table.playerId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameFirst => $state.composableBuilder(
      column: $state.table.nameFirst,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameLast => $state.composableBuilder(
      column: $state.table.nameLast,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$BattingStatsTableCreateCompanionBuilder = BattingStatsCompanion
    Function({
  required String playerId,
  required int displayOrder,
  required int year,
  required String teamId,
  required int games,
  required int plateAppearances,
  required int atBats,
  required int hits,
  required int extraBaseHits,
  required int totalBases,
  required int doubles,
  required int triples,
  required int homeRuns,
  required int runs,
  required int runsBattedIn,
  required int walks,
  required int intentionalWalks,
  required int hitByPitch,
  required int strikeouts,
  required int stolenBases,
  required int caughtStealing,
  required int sacrificeHits,
  required int sacrificeFlies,
  required int groundedIntoDoublePlays,
  Value<double?> battingAverage,
  Value<double?> onBasePercentage,
  Value<double?> sluggingPercentage,
  Value<double?> onBasePlusSlugging,
  Value<double?> battingAverageOnBallsInPlay,
  Value<double?> isolatedPower,
  Value<double?> atBatsPerHomeRun,
  Value<double?> walkToStrikeoutRatio,
  Value<double?> walkPercentage,
  Value<double?> strikeoutPercentage,
  Value<int> rowid,
});
typedef $$BattingStatsTableUpdateCompanionBuilder = BattingStatsCompanion
    Function({
  Value<String> playerId,
  Value<int> displayOrder,
  Value<int> year,
  Value<String> teamId,
  Value<int> games,
  Value<int> plateAppearances,
  Value<int> atBats,
  Value<int> hits,
  Value<int> extraBaseHits,
  Value<int> totalBases,
  Value<int> doubles,
  Value<int> triples,
  Value<int> homeRuns,
  Value<int> runs,
  Value<int> runsBattedIn,
  Value<int> walks,
  Value<int> intentionalWalks,
  Value<int> hitByPitch,
  Value<int> strikeouts,
  Value<int> stolenBases,
  Value<int> caughtStealing,
  Value<int> sacrificeHits,
  Value<int> sacrificeFlies,
  Value<int> groundedIntoDoublePlays,
  Value<double?> battingAverage,
  Value<double?> onBasePercentage,
  Value<double?> sluggingPercentage,
  Value<double?> onBasePlusSlugging,
  Value<double?> battingAverageOnBallsInPlay,
  Value<double?> isolatedPower,
  Value<double?> atBatsPerHomeRun,
  Value<double?> walkToStrikeoutRatio,
  Value<double?> walkPercentage,
  Value<double?> strikeoutPercentage,
  Value<int> rowid,
});

class $$BattingStatsTableTableManager extends RootTableManager<
    _$MyDriftDatabase,
    $BattingStatsTable,
    BattingStat,
    $$BattingStatsTableFilterComposer,
    $$BattingStatsTableOrderingComposer,
    $$BattingStatsTableCreateCompanionBuilder,
    $$BattingStatsTableUpdateCompanionBuilder> {
  $$BattingStatsTableTableManager(
      _$MyDriftDatabase db, $BattingStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BattingStatsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BattingStatsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> playerId = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<String> teamId = const Value.absent(),
            Value<int> games = const Value.absent(),
            Value<int> plateAppearances = const Value.absent(),
            Value<int> atBats = const Value.absent(),
            Value<int> hits = const Value.absent(),
            Value<int> extraBaseHits = const Value.absent(),
            Value<int> totalBases = const Value.absent(),
            Value<int> doubles = const Value.absent(),
            Value<int> triples = const Value.absent(),
            Value<int> homeRuns = const Value.absent(),
            Value<int> runs = const Value.absent(),
            Value<int> runsBattedIn = const Value.absent(),
            Value<int> walks = const Value.absent(),
            Value<int> intentionalWalks = const Value.absent(),
            Value<int> hitByPitch = const Value.absent(),
            Value<int> strikeouts = const Value.absent(),
            Value<int> stolenBases = const Value.absent(),
            Value<int> caughtStealing = const Value.absent(),
            Value<int> sacrificeHits = const Value.absent(),
            Value<int> sacrificeFlies = const Value.absent(),
            Value<int> groundedIntoDoublePlays = const Value.absent(),
            Value<double?> battingAverage = const Value.absent(),
            Value<double?> onBasePercentage = const Value.absent(),
            Value<double?> sluggingPercentage = const Value.absent(),
            Value<double?> onBasePlusSlugging = const Value.absent(),
            Value<double?> battingAverageOnBallsInPlay = const Value.absent(),
            Value<double?> isolatedPower = const Value.absent(),
            Value<double?> atBatsPerHomeRun = const Value.absent(),
            Value<double?> walkToStrikeoutRatio = const Value.absent(),
            Value<double?> walkPercentage = const Value.absent(),
            Value<double?> strikeoutPercentage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BattingStatsCompanion(
            playerId: playerId,
            displayOrder: displayOrder,
            year: year,
            teamId: teamId,
            games: games,
            plateAppearances: plateAppearances,
            atBats: atBats,
            hits: hits,
            extraBaseHits: extraBaseHits,
            totalBases: totalBases,
            doubles: doubles,
            triples: triples,
            homeRuns: homeRuns,
            runs: runs,
            runsBattedIn: runsBattedIn,
            walks: walks,
            intentionalWalks: intentionalWalks,
            hitByPitch: hitByPitch,
            strikeouts: strikeouts,
            stolenBases: stolenBases,
            caughtStealing: caughtStealing,
            sacrificeHits: sacrificeHits,
            sacrificeFlies: sacrificeFlies,
            groundedIntoDoublePlays: groundedIntoDoublePlays,
            battingAverage: battingAverage,
            onBasePercentage: onBasePercentage,
            sluggingPercentage: sluggingPercentage,
            onBasePlusSlugging: onBasePlusSlugging,
            battingAverageOnBallsInPlay: battingAverageOnBallsInPlay,
            isolatedPower: isolatedPower,
            atBatsPerHomeRun: atBatsPerHomeRun,
            walkToStrikeoutRatio: walkToStrikeoutRatio,
            walkPercentage: walkPercentage,
            strikeoutPercentage: strikeoutPercentage,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String playerId,
            required int displayOrder,
            required int year,
            required String teamId,
            required int games,
            required int plateAppearances,
            required int atBats,
            required int hits,
            required int extraBaseHits,
            required int totalBases,
            required int doubles,
            required int triples,
            required int homeRuns,
            required int runs,
            required int runsBattedIn,
            required int walks,
            required int intentionalWalks,
            required int hitByPitch,
            required int strikeouts,
            required int stolenBases,
            required int caughtStealing,
            required int sacrificeHits,
            required int sacrificeFlies,
            required int groundedIntoDoublePlays,
            Value<double?> battingAverage = const Value.absent(),
            Value<double?> onBasePercentage = const Value.absent(),
            Value<double?> sluggingPercentage = const Value.absent(),
            Value<double?> onBasePlusSlugging = const Value.absent(),
            Value<double?> battingAverageOnBallsInPlay = const Value.absent(),
            Value<double?> isolatedPower = const Value.absent(),
            Value<double?> atBatsPerHomeRun = const Value.absent(),
            Value<double?> walkToStrikeoutRatio = const Value.absent(),
            Value<double?> walkPercentage = const Value.absent(),
            Value<double?> strikeoutPercentage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BattingStatsCompanion.insert(
            playerId: playerId,
            displayOrder: displayOrder,
            year: year,
            teamId: teamId,
            games: games,
            plateAppearances: plateAppearances,
            atBats: atBats,
            hits: hits,
            extraBaseHits: extraBaseHits,
            totalBases: totalBases,
            doubles: doubles,
            triples: triples,
            homeRuns: homeRuns,
            runs: runs,
            runsBattedIn: runsBattedIn,
            walks: walks,
            intentionalWalks: intentionalWalks,
            hitByPitch: hitByPitch,
            strikeouts: strikeouts,
            stolenBases: stolenBases,
            caughtStealing: caughtStealing,
            sacrificeHits: sacrificeHits,
            sacrificeFlies: sacrificeFlies,
            groundedIntoDoublePlays: groundedIntoDoublePlays,
            battingAverage: battingAverage,
            onBasePercentage: onBasePercentage,
            sluggingPercentage: sluggingPercentage,
            onBasePlusSlugging: onBasePlusSlugging,
            battingAverageOnBallsInPlay: battingAverageOnBallsInPlay,
            isolatedPower: isolatedPower,
            atBatsPerHomeRun: atBatsPerHomeRun,
            walkToStrikeoutRatio: walkToStrikeoutRatio,
            walkPercentage: walkPercentage,
            strikeoutPercentage: strikeoutPercentage,
            rowid: rowid,
          ),
        ));
}

class $$BattingStatsTableFilterComposer
    extends FilterComposer<_$MyDriftDatabase, $BattingStatsTable> {
  $$BattingStatsTableFilterComposer(super.$state);
  ColumnFilters<String> get playerId => $state.composableBuilder(
      column: $state.table.playerId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get displayOrder => $state.composableBuilder(
      column: $state.table.displayOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get year => $state.composableBuilder(
      column: $state.table.year,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get teamId => $state.composableBuilder(
      column: $state.table.teamId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get games => $state.composableBuilder(
      column: $state.table.games,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get plateAppearances => $state.composableBuilder(
      column: $state.table.plateAppearances,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get atBats => $state.composableBuilder(
      column: $state.table.atBats,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hits => $state.composableBuilder(
      column: $state.table.hits,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get extraBaseHits => $state.composableBuilder(
      column: $state.table.extraBaseHits,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get totalBases => $state.composableBuilder(
      column: $state.table.totalBases,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get doubles => $state.composableBuilder(
      column: $state.table.doubles,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get triples => $state.composableBuilder(
      column: $state.table.triples,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get homeRuns => $state.composableBuilder(
      column: $state.table.homeRuns,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get runs => $state.composableBuilder(
      column: $state.table.runs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get runsBattedIn => $state.composableBuilder(
      column: $state.table.runsBattedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get walks => $state.composableBuilder(
      column: $state.table.walks,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get intentionalWalks => $state.composableBuilder(
      column: $state.table.intentionalWalks,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hitByPitch => $state.composableBuilder(
      column: $state.table.hitByPitch,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get strikeouts => $state.composableBuilder(
      column: $state.table.strikeouts,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stolenBases => $state.composableBuilder(
      column: $state.table.stolenBases,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get caughtStealing => $state.composableBuilder(
      column: $state.table.caughtStealing,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sacrificeHits => $state.composableBuilder(
      column: $state.table.sacrificeHits,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sacrificeFlies => $state.composableBuilder(
      column: $state.table.sacrificeFlies,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get groundedIntoDoublePlays => $state.composableBuilder(
      column: $state.table.groundedIntoDoublePlays,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get battingAverage => $state.composableBuilder(
      column: $state.table.battingAverage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get onBasePercentage => $state.composableBuilder(
      column: $state.table.onBasePercentage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sluggingPercentage => $state.composableBuilder(
      column: $state.table.sluggingPercentage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get onBasePlusSlugging => $state.composableBuilder(
      column: $state.table.onBasePlusSlugging,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get battingAverageOnBallsInPlay => $state
      .composableBuilder(
          column: $state.table.battingAverageOnBallsInPlay,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get isolatedPower => $state.composableBuilder(
      column: $state.table.isolatedPower,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get atBatsPerHomeRun => $state.composableBuilder(
      column: $state.table.atBatsPerHomeRun,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get walkToStrikeoutRatio => $state.composableBuilder(
      column: $state.table.walkToStrikeoutRatio,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get walkPercentage => $state.composableBuilder(
      column: $state.table.walkPercentage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get strikeoutPercentage => $state.composableBuilder(
      column: $state.table.strikeoutPercentage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BattingStatsTableOrderingComposer
    extends OrderingComposer<_$MyDriftDatabase, $BattingStatsTable> {
  $$BattingStatsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get playerId => $state.composableBuilder(
      column: $state.table.playerId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get displayOrder => $state.composableBuilder(
      column: $state.table.displayOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get year => $state.composableBuilder(
      column: $state.table.year,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get teamId => $state.composableBuilder(
      column: $state.table.teamId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get games => $state.composableBuilder(
      column: $state.table.games,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get plateAppearances => $state.composableBuilder(
      column: $state.table.plateAppearances,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get atBats => $state.composableBuilder(
      column: $state.table.atBats,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hits => $state.composableBuilder(
      column: $state.table.hits,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get extraBaseHits => $state.composableBuilder(
      column: $state.table.extraBaseHits,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get totalBases => $state.composableBuilder(
      column: $state.table.totalBases,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get doubles => $state.composableBuilder(
      column: $state.table.doubles,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get triples => $state.composableBuilder(
      column: $state.table.triples,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get homeRuns => $state.composableBuilder(
      column: $state.table.homeRuns,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get runs => $state.composableBuilder(
      column: $state.table.runs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get runsBattedIn => $state.composableBuilder(
      column: $state.table.runsBattedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get walks => $state.composableBuilder(
      column: $state.table.walks,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get intentionalWalks => $state.composableBuilder(
      column: $state.table.intentionalWalks,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hitByPitch => $state.composableBuilder(
      column: $state.table.hitByPitch,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get strikeouts => $state.composableBuilder(
      column: $state.table.strikeouts,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stolenBases => $state.composableBuilder(
      column: $state.table.stolenBases,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get caughtStealing => $state.composableBuilder(
      column: $state.table.caughtStealing,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sacrificeHits => $state.composableBuilder(
      column: $state.table.sacrificeHits,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sacrificeFlies => $state.composableBuilder(
      column: $state.table.sacrificeFlies,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get groundedIntoDoublePlays => $state.composableBuilder(
      column: $state.table.groundedIntoDoublePlays,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get battingAverage => $state.composableBuilder(
      column: $state.table.battingAverage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get onBasePercentage => $state.composableBuilder(
      column: $state.table.onBasePercentage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sluggingPercentage => $state.composableBuilder(
      column: $state.table.sluggingPercentage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get onBasePlusSlugging => $state.composableBuilder(
      column: $state.table.onBasePlusSlugging,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get battingAverageOnBallsInPlay =>
      $state.composableBuilder(
          column: $state.table.battingAverageOnBallsInPlay,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get isolatedPower => $state.composableBuilder(
      column: $state.table.isolatedPower,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get atBatsPerHomeRun => $state.composableBuilder(
      column: $state.table.atBatsPerHomeRun,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get walkToStrikeoutRatio => $state.composableBuilder(
      column: $state.table.walkToStrikeoutRatio,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get walkPercentage => $state.composableBuilder(
      column: $state.table.walkPercentage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get strikeoutPercentage => $state.composableBuilder(
      column: $state.table.strikeoutPercentage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $MyDriftDatabaseManager {
  final _$MyDriftDatabase _db;
  $MyDriftDatabaseManager(this._db);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$BattingStatsTableTableManager get battingStats =>
      $$BattingStatsTableTableManager(_db, _db.battingStats);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myDriftDatabaseHash() => r'66c7cd2997c5c795c2d06e336ac3026402702041';

/// See also [myDriftDatabase].
@ProviderFor(myDriftDatabase)
final myDriftDatabaseProvider = AutoDisposeProvider<MyDriftDatabase>.internal(
  myDriftDatabase,
  name: r'myDriftDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myDriftDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MyDriftDatabaseRef = AutoDisposeProviderRef<MyDriftDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
