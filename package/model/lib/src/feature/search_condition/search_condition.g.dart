// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchConditionImpl _$$SearchConditionImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchConditionImpl(
      id: (json['id'] as num).toInt(),
      teamList:
          (json['teamList'] as List<dynamic>).map((e) => e as String).toList(),
      minGames: (json['minGames'] as num).toInt(),
      minHits: (json['minHits'] as num).toInt(),
      minHr: (json['minHr'] as num).toInt(),
      selectedStatsList: (json['selectedStatsList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SearchConditionImplToJson(
        _$SearchConditionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamList': instance.teamList,
      'minGames': instance.minGames,
      'minHits': instance.minHits,
      'minHr': instance.minHr,
      'selectedStatsList': instance.selectedStatsList,
    };
