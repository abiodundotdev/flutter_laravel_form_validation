import 'package:flutter_test/flutter_test.dart';
import 'package:laravel_validator/rules/rules.dart';

// import 'package:validator/validator.dart';

void main() {
  //List<String> numericRules = ['numeric', 'integer', 'double'];

  //List<String> sizeRules = ['between', 'min', 'max', 'gt', 'lt', 'lte', 'lte'];

  //List<String> stringRules = ['starts_with', 'ends_with'];

  //List<String> implicitRules = ['required'];

  //List<String> others = ['alpha_num'];

  group("Test for implicit rules", () {
    test('Required with value', () {
      String value = "Qazeem Qudus";
      expect(Required(value: value).validator(), null);
    });
    test('Required without value', () {
      expect(Required(value: "").validator(), isA<String>());
    });
  });

  group("Test for numeric rules", () {
    test('Numeric with value number | numeric', () {
      String value = "23.23";
      expect(Numeric(value: value).validator(), null);
    });
    test('Numeric without number | numeric', () {
      expect(Numeric(value: "qazeem").validator(), isA<String>());
    });

    test('Double with value number | double', () {
      String value = "23.23";
      expect(Double(value: value).validator(), null);
    });
    test('Double without number | double', () {
      expect(Double(value: "qazeem").validator(), isA<String>());
    });

    test('Integer with value number', () {
      String value = "23";
      expect(Integer(value: value).validator(), null);
    });
    test('Integer without number', () {
      expect(Integer(value: "qazeem").validator(), isA<String>());
    });
  });
}
