// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'db_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DbConfig {
  /// 配信中の DB のバージョン。
  Version get dbVersion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbConfigCopyWith<DbConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbConfigCopyWith<$Res> {
  factory $DbConfigCopyWith(DbConfig value, $Res Function(DbConfig) then) =
      _$DbConfigCopyWithImpl<$Res, DbConfig>;
  @useResult
  $Res call({Version dbVersion});
}

/// @nodoc
class _$DbConfigCopyWithImpl<$Res, $Val extends DbConfig>
    implements $DbConfigCopyWith<$Res> {
  _$DbConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbVersion = null,
  }) {
    return _then(_value.copyWith(
      dbVersion: null == dbVersion
          ? _value.dbVersion
          : dbVersion // ignore: cast_nullable_to_non_nullable
              as Version,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DbConfigImplCopyWith<$Res>
    implements $DbConfigCopyWith<$Res> {
  factory _$$DbConfigImplCopyWith(
          _$DbConfigImpl value, $Res Function(_$DbConfigImpl) then) =
      __$$DbConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Version dbVersion});
}

/// @nodoc
class __$$DbConfigImplCopyWithImpl<$Res>
    extends _$DbConfigCopyWithImpl<$Res, _$DbConfigImpl>
    implements _$$DbConfigImplCopyWith<$Res> {
  __$$DbConfigImplCopyWithImpl(
      _$DbConfigImpl _value, $Res Function(_$DbConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbVersion = null,
  }) {
    return _then(_$DbConfigImpl(
      dbVersion: null == dbVersion
          ? _value.dbVersion
          : dbVersion // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc

class _$DbConfigImpl extends _DbConfig {
  const _$DbConfigImpl({required this.dbVersion}) : super._();

  /// 配信中の DB のバージョン。
  @override
  final Version dbVersion;

  @override
  String toString() {
    return 'DbConfig(dbVersion: $dbVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DbConfigImpl &&
            (identical(other.dbVersion, dbVersion) ||
                other.dbVersion == dbVersion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DbConfigImplCopyWith<_$DbConfigImpl> get copyWith =>
      __$$DbConfigImplCopyWithImpl<_$DbConfigImpl>(this, _$identity);
}

abstract class _DbConfig extends DbConfig {
  const factory _DbConfig({required final Version dbVersion}) = _$DbConfigImpl;
  const _DbConfig._() : super._();

  @override

  /// 配信中の DB のバージョン。
  Version get dbVersion;
  @override
  @JsonKey(ignore: true)
  _$$DbConfigImplCopyWith<_$DbConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
