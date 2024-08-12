import 'app_exception.dart';

class DatabaseException extends AppException {
  const DatabaseException._([
    super.message = 'database exception',
    DatabaseExceptionType? code,
  ]) : code = code ?? DatabaseExceptionType.unknown;

  /// データが見つからない
  factory DatabaseException.notFound() => const DatabaseException._(
        'データが見つかりませんでした。',
        DatabaseExceptionType.notFound,
      );

  /// 不明なエラー
  factory DatabaseException.unknown() => const DatabaseException._(
        'An unknown error has occurred.',
        DatabaseExceptionType.unknown,
      );

  /// エラー種別
  final DatabaseExceptionType code;

  @override
  String toString() => 'FirestoreExceptionCode[${code.name}]: $message';
}

/// データベース関連の例外の種別。
enum DatabaseExceptionType {
  /// データが見つからない
  notFound,

  /// 権限関係のエラー
  permission,

  /// 不明なエラー
  unknown;
}
