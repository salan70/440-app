// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentAppVersionHash() => r'405ec9d3e4576c9b15b74b11c3d34466d5358829';

/// 現在のアプリバージョンを保持する。
///
/// Copied from [currentAppVersion].
@ProviderFor(currentAppVersion)
final currentAppVersionProvider = AutoDisposeFutureProvider<Version>.internal(
  currentAppVersion,
  name: r'currentAppVersionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAppVersionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentAppVersionRef = AutoDisposeFutureProviderRef<Version>;
String _$needUpdateHash() => r'700d83e10f9de5c1d841a62300d921c2030757f5';

/// アプリのアップデートが必要かどうかを返す。
///
/// Copied from [needUpdate].
@ProviderFor(needUpdate)
final needUpdateProvider = AutoDisposeFutureProvider<bool>.internal(
  needUpdate,
  name: r'needUpdateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$needUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NeedUpdateRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
