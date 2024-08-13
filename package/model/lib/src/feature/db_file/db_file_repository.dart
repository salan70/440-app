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

  /// 指定されたバージョンの選手情報の DB をダウンロードし、
  /// [Uint8List] として返す。
  ///
  /// [version] : データベースのバージョン
  Future<Uint8List?> downloadPlayersDb(String version) async {
    return _downloadDbFile(version, 'players.db');
  }

  /// 指定されたバージョンの打撃成績の DB をダウンロードし、
  /// [Uint8List] として返す。
  ///
  /// [version] : データベースのバージョン
  Future<Uint8List?> downloadBattingStatsDb(String version) async {
    return _downloadDbFile(version, 'batting_stats.db');
  }

  /// 指定されたバージョンとファイル名のDBをダウンロードし、
  /// [Uint8List] として返す。
  ///
  /// [version] : データベースのバージョン
  /// [fileName] : ダウンロードするファイル名
  Future<Uint8List?> _downloadDbFile(String version, String fileName) async {
    final path = 'databases/$version/$fileName';
    final data = await storage.ref(path).getData();
    return data;
  }
}
