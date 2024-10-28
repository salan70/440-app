import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../tables.dart';

part 'drift_database.g.dart';

/// Drift データベースを保持するプロバイダー。
///
/// プラットフォーム（ モバイル or Web ）に応じた
/// 適切な Drift データベースの実装を `override` して使用すること。
@riverpod
BaseDriftDatabase driftDatabase(DriftDatabaseRef ref) =>
    throw UnimplementedError('This should be overridden.');

/// Drift データベースの抽象クラス。
@DriftDatabase(tables: [Players, BattingStats, TotalBattingStats])
abstract class BaseDriftDatabase extends _$BaseDriftDatabase {
  BaseDriftDatabase(super.e, this.dbPath);

  final String dbPath;
}

/// Drift データベースのファイル名。
const driftDatabaseName = 'drift.db';
