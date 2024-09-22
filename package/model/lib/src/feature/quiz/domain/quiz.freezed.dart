// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Quiz {
  /// 回答となる選手のID.
  String get playerId => throw _privateConstructorUsedError;

  /// 回答となる選手の名前。
  String get playerName => throw _privateConstructorUsedError;

  /// 年ごとのデータ。
  List<YearStats> get yearStats => throw _privateConstructorUsedError;

  /// 出題するデータの種別。
  List<StatsType> get selectedStats => throw _privateConstructorUsedError;

  /// ユーザーが公開したデータの数。
  int get unveilCount => throw _privateConstructorUsedError;

  /// ユーザーが不正解した数。
  int get incorrectCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {String playerId,
      String playerName,
      List<YearStats> yearStats,
      List<StatsType> selectedStats,
      int unveilCount,
      int incorrectCount});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = null,
    Object? yearStats = null,
    Object? selectedStats = null,
    Object? unveilCount = null,
    Object? incorrectCount = null,
  }) {
    return _then(_value.copyWith(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      yearStats: null == yearStats
          ? _value.yearStats
          : yearStats // ignore: cast_nullable_to_non_nullable
              as List<YearStats>,
      selectedStats: null == selectedStats
          ? _value.selectedStats
          : selectedStats // ignore: cast_nullable_to_non_nullable
              as List<StatsType>,
      unveilCount: null == unveilCount
          ? _value.unveilCount
          : unveilCount // ignore: cast_nullable_to_non_nullable
              as int,
      incorrectCount: null == incorrectCount
          ? _value.incorrectCount
          : incorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String playerId,
      String playerName,
      List<YearStats> yearStats,
      List<StatsType> selectedStats,
      int unveilCount,
      int incorrectCount});
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = null,
    Object? yearStats = null,
    Object? selectedStats = null,
    Object? unveilCount = null,
    Object? incorrectCount = null,
  }) {
    return _then(_$QuizImpl(
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      yearStats: null == yearStats
          ? _value._yearStats
          : yearStats // ignore: cast_nullable_to_non_nullable
              as List<YearStats>,
      selectedStats: null == selectedStats
          ? _value._selectedStats
          : selectedStats // ignore: cast_nullable_to_non_nullable
              as List<StatsType>,
      unveilCount: null == unveilCount
          ? _value.unveilCount
          : unveilCount // ignore: cast_nullable_to_non_nullable
              as int,
      incorrectCount: null == incorrectCount
          ? _value.incorrectCount
          : incorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QuizImpl extends _Quiz {
  const _$QuizImpl(
      {required this.playerId,
      required this.playerName,
      required final List<YearStats> yearStats,
      required final List<StatsType> selectedStats,
      required this.unveilCount,
      required this.incorrectCount})
      : _yearStats = yearStats,
        _selectedStats = selectedStats,
        super._();

  /// 回答となる選手のID.
  @override
  final String playerId;

  /// 回答となる選手の名前。
  @override
  final String playerName;

  /// 年ごとのデータ。
  final List<YearStats> _yearStats;

  /// 年ごとのデータ。
  @override
  List<YearStats> get yearStats {
    if (_yearStats is EqualUnmodifiableListView) return _yearStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yearStats);
  }

  /// 出題するデータの種別。
  final List<StatsType> _selectedStats;

  /// 出題するデータの種別。
  @override
  List<StatsType> get selectedStats {
    if (_selectedStats is EqualUnmodifiableListView) return _selectedStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedStats);
  }

  /// ユーザーが公開したデータの数。
  @override
  final int unveilCount;

  /// ユーザーが不正解した数。
  @override
  final int incorrectCount;

  @override
  String toString() {
    return 'Quiz(playerId: $playerId, playerName: $playerName, yearStats: $yearStats, selectedStats: $selectedStats, unveilCount: $unveilCount, incorrectCount: $incorrectCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            const DeepCollectionEquality()
                .equals(other._yearStats, _yearStats) &&
            const DeepCollectionEquality()
                .equals(other._selectedStats, _selectedStats) &&
            (identical(other.unveilCount, unveilCount) ||
                other.unveilCount == unveilCount) &&
            (identical(other.incorrectCount, incorrectCount) ||
                other.incorrectCount == incorrectCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      playerId,
      playerName,
      const DeepCollectionEquality().hash(_yearStats),
      const DeepCollectionEquality().hash(_selectedStats),
      unveilCount,
      incorrectCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);
}

abstract class _Quiz extends Quiz {
  const factory _Quiz(
      {required final String playerId,
      required final String playerName,
      required final List<YearStats> yearStats,
      required final List<StatsType> selectedStats,
      required final int unveilCount,
      required final int incorrectCount}) = _$QuizImpl;
  const _Quiz._() : super._();

  @override

  /// 回答となる選手のID.
  String get playerId;
  @override

  /// 回答となる選手の名前。
  String get playerName;
  @override

  /// 年ごとのデータ。
  List<YearStats> get yearStats;
  @override

  /// 出題するデータの種別。
  List<StatsType> get selectedStats;
  @override

  /// ユーザーが公開したデータの数。
  int get unveilCount;
  @override

  /// ユーザーが不正解した数。
  int get incorrectCount;
  @override
  @JsonKey(ignore: true)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

YearStats _$YearStatsFromJson(Map<String, dynamic> json) {
  return _YearStats.fromJson(json);
}

/// @nodoc
mixin _$YearStats {
  String get year => throw _privateConstructorUsedError;
  Map<StatsType, StatsValue> get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YearStatsCopyWith<YearStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearStatsCopyWith<$Res> {
  factory $YearStatsCopyWith(YearStats value, $Res Function(YearStats) then) =
      _$YearStatsCopyWithImpl<$Res, YearStats>;
  @useResult
  $Res call({String year, Map<StatsType, StatsValue> stats});
}

/// @nodoc
class _$YearStatsCopyWithImpl<$Res, $Val extends YearStats>
    implements $YearStatsCopyWith<$Res> {
  _$YearStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Map<StatsType, StatsValue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YearStatsImplCopyWith<$Res>
    implements $YearStatsCopyWith<$Res> {
  factory _$$YearStatsImplCopyWith(
          _$YearStatsImpl value, $Res Function(_$YearStatsImpl) then) =
      __$$YearStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String year, Map<StatsType, StatsValue> stats});
}

/// @nodoc
class __$$YearStatsImplCopyWithImpl<$Res>
    extends _$YearStatsCopyWithImpl<$Res, _$YearStatsImpl>
    implements _$$YearStatsImplCopyWith<$Res> {
  __$$YearStatsImplCopyWithImpl(
      _$YearStatsImpl _value, $Res Function(_$YearStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? stats = null,
  }) {
    return _then(_$YearStatsImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Map<StatsType, StatsValue>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YearStatsImpl extends _YearStats {
  const _$YearStatsImpl(
      {required this.year, required final Map<StatsType, StatsValue> stats})
      : _stats = stats,
        super._();

  factory _$YearStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$YearStatsImplFromJson(json);

  @override
  final String year;
  final Map<StatsType, StatsValue> _stats;
  @override
  Map<StatsType, StatsValue> get stats {
    if (_stats is EqualUnmodifiableMapView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stats);
  }

  @override
  String toString() {
    return 'YearStats(year: $year, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearStatsImpl &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(other._stats, _stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, year, const DeepCollectionEquality().hash(_stats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YearStatsImplCopyWith<_$YearStatsImpl> get copyWith =>
      __$$YearStatsImplCopyWithImpl<_$YearStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YearStatsImplToJson(
      this,
    );
  }
}

abstract class _YearStats extends YearStats {
  const factory _YearStats(
      {required final String year,
      required final Map<StatsType, StatsValue> stats}) = _$YearStatsImpl;
  const _YearStats._() : super._();

  factory _YearStats.fromJson(Map<String, dynamic> json) =
      _$YearStatsImpl.fromJson;

  @override
  String get year;
  @override
  Map<StatsType, StatsValue> get stats;
  @override
  @JsonKey(ignore: true)
  _$$YearStatsImplCopyWith<_$YearStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatsValue _$StatsValueFromJson(Map<String, dynamic> json) {
  return _StatsValue.fromJson(json);
}

/// @nodoc
mixin _$StatsValue {
  /// 表示順。
  int get unveilOrder => throw _privateConstructorUsedError;

  /// 成績（データ）。
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsValueCopyWith<StatsValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsValueCopyWith<$Res> {
  factory $StatsValueCopyWith(
          StatsValue value, $Res Function(StatsValue) then) =
      _$StatsValueCopyWithImpl<$Res, StatsValue>;
  @useResult
  $Res call({int unveilOrder, String data});
}

/// @nodoc
class _$StatsValueCopyWithImpl<$Res, $Val extends StatsValue>
    implements $StatsValueCopyWith<$Res> {
  _$StatsValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unveilOrder = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      unveilOrder: null == unveilOrder
          ? _value.unveilOrder
          : unveilOrder // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsValueImplCopyWith<$Res>
    implements $StatsValueCopyWith<$Res> {
  factory _$$StatsValueImplCopyWith(
          _$StatsValueImpl value, $Res Function(_$StatsValueImpl) then) =
      __$$StatsValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int unveilOrder, String data});
}

/// @nodoc
class __$$StatsValueImplCopyWithImpl<$Res>
    extends _$StatsValueCopyWithImpl<$Res, _$StatsValueImpl>
    implements _$$StatsValueImplCopyWith<$Res> {
  __$$StatsValueImplCopyWithImpl(
      _$StatsValueImpl _value, $Res Function(_$StatsValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unveilOrder = null,
    Object? data = null,
  }) {
    return _then(_$StatsValueImpl(
      unveilOrder: null == unveilOrder
          ? _value.unveilOrder
          : unveilOrder // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsValueImpl extends _StatsValue {
  const _$StatsValueImpl({required this.unveilOrder, required this.data})
      : super._();

  factory _$StatsValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsValueImplFromJson(json);

  /// 表示順。
  @override
  final int unveilOrder;

  /// 成績（データ）。
  @override
  final String data;

  @override
  String toString() {
    return 'StatsValue(unveilOrder: $unveilOrder, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsValueImpl &&
            (identical(other.unveilOrder, unveilOrder) ||
                other.unveilOrder == unveilOrder) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unveilOrder, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsValueImplCopyWith<_$StatsValueImpl> get copyWith =>
      __$$StatsValueImplCopyWithImpl<_$StatsValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsValueImplToJson(
      this,
    );
  }
}

abstract class _StatsValue extends StatsValue {
  const factory _StatsValue(
      {required final int unveilOrder,
      required final String data}) = _$StatsValueImpl;
  const _StatsValue._() : super._();

  factory _StatsValue.fromJson(Map<String, dynamic> json) =
      _$StatsValueImpl.fromJson;

  @override

  /// 表示順。
  int get unveilOrder;
  @override

  /// 成績（データ）。
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$StatsValueImplCopyWith<_$StatsValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
