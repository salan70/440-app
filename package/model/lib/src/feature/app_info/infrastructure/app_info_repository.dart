import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

part 'app_info_repository.g.dart';

@riverpod
AppInfoRepository appInfoRepository(AppInfoRepositoryRef ref) =>
    AppInfoRepository(FirebaseFirestore.instance);

class AppInfoRepository {
  AppInfoRepository(this.firestore);

  final FirebaseFirestore firestore;

  /// iOS でプレイするのに必要なアプリバージョンを取得する。
  Future<Version> fetchRequiredAppVersionForIos() async {
    final doc =
        await firestore.collection('config').doc('configDocument').get();
    return Version.parse(doc.data()!['requiredAppVersionForIos'] as String);
  }

  /// Android でプレイするのに必要なアプリバージョンを取得する。
  Future<Version> fetchRequiredAppVersionForAndroid() async {
    final doc =
        await firestore.collection('config').doc('configDocument').get();
    return Version.parse(doc.data()!['requiredAppVersionForAndroid'] as String);
  }
}
