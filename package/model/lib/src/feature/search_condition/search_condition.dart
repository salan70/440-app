import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'search_condition.freezed.dart';
part 'search_condition.g.dart';

@freezed
class SearchCondition with _$SearchCondition {
  @Entity(realClass: SearchCondition)
  const factory SearchCondition({
    @Id(assignable: true) required int id,
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

  static const defaultId = 1;
}
