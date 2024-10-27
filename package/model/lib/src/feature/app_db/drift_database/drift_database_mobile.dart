import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'drift_database.dart';

/// モバイルアプリ用の Drift データベースの実装。
class MyDriftDatabase extends BaseDriftDatabase {
  MyDriftDatabase(String dbPath) : super(_connect(dbPath), dbPath);

  @override
  int get schemaVersion => 1;
}

QueryExecutor _connect(String dbPath) {
  return LazyDatabase(() async {
    final file = File(dbPath);

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase.createInBackground(file);
  });
}
