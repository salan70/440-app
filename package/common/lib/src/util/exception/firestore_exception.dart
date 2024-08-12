import 'app_exception.dart';

class FirestoreException extends AppException {
  const FirestoreException._([
    super.message = 'firestore exception',
    FirestoreExceptionCode? code,
  ]) : code = code ?? FirestoreExceptionCode.unknown;

  /// データが見つからない
  factory FirestoreException.notFound() => const FirestoreException._(
        'データが見つかりませんでした。',
        FirestoreExceptionCode.notFound,
      );

  /// 不明なエラー
  factory FirestoreException.unknown() => const FirestoreException._(
        'An unknown error has occurred.',
        FirestoreExceptionCode.unknown,
      );

  /// エラーコード
  final FirestoreExceptionCode code;

  @override
  String toString() => 'FirestoreExceptionCode[${code.name}]: $message';
}

/// データベース関連の例外のエラーコード
enum FirestoreExceptionCode {
  /// データが見つからない
  notFound,

  /// 不明なエラー
  unknown,
  ;
}
