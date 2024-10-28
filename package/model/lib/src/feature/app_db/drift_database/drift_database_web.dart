import 'package:common/common.dart';
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

import 'drift_database.dart';

/// Web アプリ用の Drift データベースの実装。
class MyDriftDatabase extends BaseDriftDatabase {
  factory MyDriftDatabase(String dbPath) =>
      MyDriftDatabase._(_connect(), dbPath);
  MyDriftDatabase._(super.e, super.dbPath);

  @override
  int get schemaVersion => 1;
}

DatabaseConnection _connect() {
  return DatabaseConnection.delayed(
    Future(() async {
      final result = await WasmDatabase.open(
        databaseName: driftDatabaseName,
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.js'),
      );

      if (result.missingFeatures.isNotEmpty) {
        logger.i('Using ${result.chosenImplementation} due to missing browser '
            'features: ${result.missingFeatures}');
      }

      return result.resolvedExecutor;
    }),
  );
}
