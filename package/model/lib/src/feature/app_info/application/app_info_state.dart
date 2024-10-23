import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

import '../infrastructure/app_info_repository.dart';

part 'app_info_state.g.dart';

/// 現在のアプリバージョンを保持する。
@riverpod
Future<Version> currentAppVersion(CurrentAppVersionRef ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return Version.parse(packageInfo.version);
}

/// アプリのアップデートが必要かどうかを返す。
@riverpod
Future<bool> needUpdate(NeedUpdateRef ref) async {
  // アプリのバージョンを取得する。
  final userAppVersion = await ref.watch(currentAppVersionProvider.future);

  final appInfoRepository = ref.watch(appInfoRepositoryProvider);
  final requiredAppVersions =
      await appInfoRepository.fetchRequiredAppVersions();

  if (Platform.isAndroid) {
    // * Android の場合
    return userAppVersion < requiredAppVersions.android;
  }

  // * iOS の場合
  return userAppVersion < requiredAppVersions.ios;
}
