import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_condition.freezed.dart';
part 'search_condition.g.dart';

@freezed
class SearchCondition with _$SearchCondition {
  const factory SearchCondition({
    required List<String> teamList,
    required int minGames,
    required int minHits,
    required int minHr,
    required List<String> selectedStatsList,
  }) = _SearchCondition;
  const SearchCondition._();

  factory SearchCondition.fromJson(Map<String, dynamic> json) =>
      _$SearchConditionFromJson(json);

  @override
  Map<String, dynamic> toJson();

  static const recordName = 'search_conditions';
}
