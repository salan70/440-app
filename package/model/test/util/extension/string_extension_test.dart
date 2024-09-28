import 'package:flutter_test/flutter_test.dart';
import 'package:model/src/util/extension/string_extension.dart';

void main() {
  group('StringExtension', () {
    group('decimalWithZero', () {
      test('小数点第4位以下を四捨五入し、小数点第3位まで表示する', () {
        // Arrange
        const input = '1.4568';

        // Act
        final result = input.decimalWithZero;

        // Assert
        expect(result, equals('1.457'));
      });

      test('数値でない文字列の場合、元の文字列を返す', () {
        // Arrange
        const input = 'abc';

        // Act
        final result = input.decimalWithZero;

        // Assert
        expect(result, equals('abc'));
      });
    });

    group('removeZeroPrefix', () {
      test('0.で始まる場合、先頭の0を削除する', () {
        // Arrange
        const input = '0.300';

        // Act
        final result = input.removeZeroPrefix;

        // Assert
        expect(result, equals('.300'));
      });

      test('0.で始まらない場合、元の文字列を返す', () {
        // Arrange
        const input = '1.4568';

        // Act
        final result = input.removeZeroPrefix;

        // Assert
        expect(result, equals('1.4568'));
      });
    });

    group('toPercent', () {
      test('小数点第5位以下を四捨五入し、%に変換する（小数点以下2桁まで表示）', () {
        // Arrange
        const input1 = '0.4568';
        const input2 = '0.8';
        const input3 = '1';

        // Act
        final result1 = input1.toPercent;
        final result2 = input2.toPercent;
        final result3 = input3.toPercent;

        // Assert
        expect(result1, equals('45.68%'));
        expect(result2, equals('80.00%'));
        expect(result3, equals('100.00%'));
      });

      test('数値でない文字列の場合、元の文字列を返す', () {
        // Arrange
        const input = 'abc';

        // Act
        final result = input.toPercent;

        // Assert
        expect(result, equals('abc'));
      });
    });
  });
}
