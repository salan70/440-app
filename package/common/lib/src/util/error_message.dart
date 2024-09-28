extension ObjectHelper on Object {
  /// エラーメッセージを返す
  String get errorMessage {
    const defaultMessage = 'エラーが発生しました。\n時間をおいて再度お試しください。';
    return defaultMessage;
  }
}
