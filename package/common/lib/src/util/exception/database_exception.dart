import 'app_exception.dart';

class DatabaseException extends AppException {
  const DatabaseException._({
    String message = 'A database error has occurred.',
    required this.dataSourceType,
    DatabaseExceptionType? code,
  })  : code = code ?? DatabaseExceptionType.unknown,
        super(message);

  /// データが見つからない
  factory DatabaseException.notFound(DataSourceType dataSourceType) =>
      DatabaseException._(
        message: 'Data not found.',
        dataSourceType: dataSourceType,
        code: DatabaseExceptionType.notFound,
      );

  /// 権限関係のエラー
  factory DatabaseException.permission(DataSourceType dataSourceType) =>
      DatabaseException._(
        message: 'Permission denied.',
        dataSourceType: dataSourceType,
        code: DatabaseExceptionType.permission,
      );

  /// 不明なエラー
  factory DatabaseException.unknown(DataSourceType dataSourceType) =>
      DatabaseException._(
        message: 'An unknown error has occurred.',
        dataSourceType: dataSourceType,
        code: DatabaseExceptionType.unknown,
      );

  /// エラー種別
  final DatabaseExceptionType code;

  /// データソースの種別。
  final DataSourceType dataSourceType;

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

/// データソースの種類。
enum DataSourceType {
  firestore,

  firebaseStorage,
  
  drift;
}
