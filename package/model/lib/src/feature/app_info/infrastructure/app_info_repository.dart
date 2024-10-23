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

  /// iOS と Android それぞれで必要なアプリバージョンを [Future] で返す。
  Future<({Version ios, Version android})> fetchRequiredAppVersions() async {
    final doc =
        await firestore.collection('config').doc('configDocument').get();

    final ios = Version.parse(
      doc.data()!['requiredAppVersionForIos'] as String,
    );

    final android = Version.parse(
      doc.data()!['requiredAppVersionForAndroid'] as String,
    );

    return (ios: ios, android: android);
  }
}
