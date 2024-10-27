import 'package:drift/drift.dart';

import 'drift_database.dart';

/// Drift データベースの抽象クラス。
class MyDriftDatabase extends BaseDriftDatabase {
  MyDriftDatabase(String dbPath) : super(_connect(dbPath), dbPath);

  @override
  int get schemaVersion => 1;
}

QueryExecutor _connect(String dbPath) => throw UnimplementedError();
