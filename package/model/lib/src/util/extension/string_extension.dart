extension StringExtension on String {
  /// 小数点第4位以下を四捨五入し、小数点第3位まで表示する。
  ///
  /// 例: 0.3 -> 0.300, 1.4568 -> 1.457
  String get decimalWithZero {
    final doubleVal = double.tryParse(this);
    if (doubleVal == null) {
      return this;
    }

    final formattedValue = doubleVal.toStringAsFixed(3);
    return formattedValue;
  }

  /// Y.XXX という形式において、 Y が 0 の場合は、 0 を削除する。
  /// 例: 0.300 -> .300, 1.4568 -> 1.4568
  String get removeZeroPrefix {
    if (startsWith('0.')) {
      return substring(1);
    }
    return this;
  }

  /// 小数点第5位以下を四捨五入し、 % に変換する。
  ///
  /// 例: 0.3 -> 30%, 0.4568 -> 45.68%
  String get toPercent {
    final doubleVal = double.tryParse(this);
    if (doubleVal == null) {
      return this;
    }

    final percentage = (doubleVal * 100).toStringAsFixed(2);
    return '$percentage%';
  }
}
