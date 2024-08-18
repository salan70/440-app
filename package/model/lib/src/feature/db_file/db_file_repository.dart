import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_file_repository.g.dart';

@riverpod
DbFileRepository dbFileRepository(DbFileRepositoryRef ref) =>
    DbFileRepository(FirebaseStorage.instance);

class DbFileRepository {
  DbFileRepository(this.storage);

  final FirebaseStorage storage;

  /// 指定されたバージョンの DB ファイルをダウンロードし、
  /// [Uint8List] として返す。
  ///
  /// [version] : データベースのバージョン
  Future<Uint8List?> downloadBaseballStatsDb(String version) async {
    final path = 'databases/$version/baseball_stats.db';
    // 30MB までのファイルをダウンロードする。
    const maxSize = 30 * 1024 * 1024;
    final data = await storage.ref(path).getData(maxSize);
    return data;
  }
}
