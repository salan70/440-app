import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'db_path_provider.dart';
import 'tables.dart';

part 'my_drift_database.g.dart';

@riverpod
MyDriftDatabase myDriftDatabase(MyDriftDatabaseRef ref) {
  final dbPath = ref.watch(dbPathProvider);
  return MyDriftDatabase(dbPath);
}

@DriftDatabase(tables: [Players, BattingStats, TotalBattingStats])
class MyDriftDatabase extends _$MyDriftDatabase {
  MyDriftDatabase(this.dbPath) : super(_openConnection(dbPath));

  @override
  int get schemaVersion => 1;
  final String dbPath;
}

LazyDatabase _openConnection(String dbPath) {
  return LazyDatabase(() async {
    final file = File(dbPath);
    return NativeDatabase.createInBackground(file);
  });
}
