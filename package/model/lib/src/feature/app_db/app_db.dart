import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'db_path_provider.dart';
import 'tables.dart';

part 'app_db.g.dart';

@riverpod
AppDb appDb(AppDbRef ref) {
  final dbPath = ref.read(dbPathProvider);
  return AppDb(dbPath);
}

@DriftDatabase(tables: [Players, BattingStats])
class AppDb extends _$AppDb {
  AppDb(this.dbPath) : super(_openConnection(dbPath));

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
