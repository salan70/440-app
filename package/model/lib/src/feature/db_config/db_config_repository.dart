import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'db_config.dart';

part 'db_config_repository.g.dart';

@riverpod
DbConfigRepository dbConfigRepository(DbConfigRepositoryRef ref) =>
    DbConfigRepository(FirebaseFirestore.instance);

class DbConfigRepository {
  DbConfigRepository(this._firestore);

  final FirebaseFirestore _firestore;

  /// [baseDate]を基準として、対象となる [DbConfig] を取得する。
  Future<DbConfig> fetchDbConfig(DateTime baseDate) async {
    final QuerySnapshot querySnapshot = await _firestore
        .collection('dbConfig')
        .where('startDate', isLessThanOrEqualTo: baseDate)
        .orderBy('startDate', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      // * 対象ドキュメントが見つからなかった場合
      throw DatabaseException.notFound(DataSourceType.firestore);
    }

    // * 対象ドキュメントが見つかった場合
    final DocumentSnapshot document = querySnapshot.docs.first;
    return DbConfig.fromFirestore(document.data()! as Map<String, dynamic>);
  }
}
