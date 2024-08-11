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
  late Version requiredAppVersion;
  if (Platform.isAndroid) {
    requiredAppVersion =
        await appInfoRepository.fetchRequiredAppVersionForAndroid();
  } else {
    requiredAppVersion =
        await appInfoRepository.fetchRequiredAppVersionForIos();
  }

  return userAppVersion < requiredAppVersion;
}
