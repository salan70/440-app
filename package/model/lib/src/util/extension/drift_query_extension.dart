import 'package:common/common.dart';
import 'package:drift/drift.dart';

extension QueryExtensions<T> on SimpleSelectStatement<Table, T> {
  /// Fetches a single result from the database.
  Future<T> fetchSingleResult() async {
    final responses = await get();

    if (responses.isEmpty) {
      throw DatabaseException.notFound(DataSourceType.drift);
    }

    return responses[0];
  }

  /// Fetches multiple results from the database.
  Future<List<T>> fetchMultipleResults() async {
    final responses = await get();

    if (responses.isEmpty) {
      throw DatabaseException.notFound(DataSourceType.drift);
    }

    return responses;
  }
}
