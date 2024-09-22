// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YearStatsImpl _$$YearStatsImplFromJson(Map<String, dynamic> json) =>
    _$YearStatsImpl(
      year: json['year'] as String,
      stats: (json['stats'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$StatsTypeEnumMap, k),
            StatsValue.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$YearStatsImplToJson(_$YearStatsImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'stats':
          instance.stats.map((k, e) => MapEntry(_$StatsTypeEnumMap[k]!, e)),
    };

const _$StatsTypeEnumMap = {
  StatsType.team: 'team',
  StatsType.games: 'games',
  StatsType.plateAppearances: 'plateAppearances',
  StatsType.atBats: 'atBats',
  StatsType.runs: 'runs',
  StatsType.hits: 'hits',
  StatsType.doubles: 'doubles',
  StatsType.triples: 'triples',
  StatsType.homeRuns: 'homeRuns',
  StatsType.totalBases: 'totalBases',
  StatsType.runsBattedIn: 'runsBattedIn',
  StatsType.stolenBases: 'stolenBases',
  StatsType.caughtStealing: 'caughtStealing',
  StatsType.sacrificeHits: 'sacrificeHits',
  StatsType.sacrificeFlies: 'sacrificeFlies',
  StatsType.walks: 'walks',
  StatsType.intentionalWalks: 'intentionalWalks',
  StatsType.hitByPitch: 'hitByPitch',
  StatsType.strikeouts: 'strikeouts',
  StatsType.groundedIntoDoublePlays: 'groundedIntoDoublePlays',
  StatsType.battingAverage: 'battingAverage',
  StatsType.onBasePercentage: 'onBasePercentage',
  StatsType.sluggingPercentage: 'sluggingPercentage',
  StatsType.onBasePlusSlugging: 'onBasePlusSlugging',
  StatsType.extraBaseHits: 'extraBaseHits',
  StatsType.battingAverageOnBallsInPlay: 'battingAverageOnBallsInPlay',
  StatsType.isolatedPower: 'isolatedPower',
  StatsType.atBatsPerHomeRun: 'atBatsPerHomeRun',
  StatsType.walkToStrikeoutRatio: 'walkToStrikeoutRatio',
  StatsType.walkPercentage: 'walkPercentage',
  StatsType.strikeoutPercentage: 'strikeoutPercentage',
};

_$StatsValueImpl _$$StatsValueImplFromJson(Map<String, dynamic> json) =>
    _$StatsValueImpl(
      unveilOrder: (json['unveilOrder'] as num).toInt(),
      data: json['data'] as String,
    );

Map<String, dynamic> _$$StatsValueImplToJson(_$StatsValueImpl instance) =>
    <String, dynamic>{
      'unveilOrder': instance.unveilOrder,
      'data': instance.data,
    };
