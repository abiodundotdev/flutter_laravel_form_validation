import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_laravel_form_validation/rules/rules.dart';

void main() {
  group("Test for implicit rules", () {
    // List<String> implicitRules = ['required'];
    test('required with value', () {
      String value = "Qazeem Qudus";
      expect(Required(value: value).validator(), null);
    });
    test('required without value', () {
      expect(Required(value: "").validator(), isA<String>());
    });
  });

  group("Test for numeric rules", () {
    // List<String> numericRules = ['numeric', 'integer', 'double'];
    test('numeric with value number | numeric', () {
      String value = "23.23";
      expect(Numeric(value: value).validator(), null);
    });
    test('numeric without number | numeric', () {
      expect(Numeric(value: "qazeem").validator(), isA<String>());
    });

    test('double with value number | double', () {
      String value = "23.23";
      expect(Double(value: value).validator(), null);
    });
    test('double without number | double', () {
      expect(Double(value: "qazeem").validator(), isA<String>());
    });

    test('integer with value number', () {
      String value = "23";
      expect(Integer(value: value).validator(), null);
    });
    test('integer without number', () {
      expect(Integer(value: "qazeem").validator(), isA<String>());
    });
  });

  group("Test for string rules", () {
    // List<String> stringRules = ['starts_with', 'ends_with', 'lowercase',   'uppercase' ];
    String value = "abiodundotdev";
    test('ends_with right value', () {
      expect(EndsWith(value: value, extra: "dev").validator(), null);
    });
    test('ends_with wrong value', () {
      expect(EndsWith(value: value, extra: "def").validator(), isA<String>());
    });

    test('starts_with right value', () {
      expect(StartsWith(value: value, extra: "abi").validator(), null);
    });
    test('starts_with wrong value', () {
      expect(
          StartsWith(value: value, extra: "adis").validator(), isA<String>());
    });

    test('upppercase with right value', () {
      expect(UpperCase(value: value.toUpperCase()).validator(), null);
    });
    test('uppercase with wrong value', () {
      expect(UpperCase(value: value).validator(), isA<String>());
    });

    test('lowerCase with right value', () {
      expect(LowerCase(value: value.toLowerCase()).validator(), null);
    });
    test('lowerCase with wrong value', () {
      expect(LowerCase(value: value.toUpperCase()).validator(), isA<String>());
    });
  });

  group("Test for size rules", () {
    // List<String> sizeRules = ['between', 'min', 'max', 'gt', 'gte', 'lt', 'lte'];
    String value = "23";
    test('between with right value', () {
      expect(Between(value: value, extra: "12,23").validator(), null);
    });
    test('between with wrong value', () {
      expect(Between(value: value, extra: "25,70").validator(), isA<String>());
    });
    test('min with right value', () {
      expect(Min(value: value, extra: "1").validator(), null);
    });
    test('min with wrong value', () {
      expect(Min(value: value, extra: "5").validator(), isA<String>());
    });

    test('max with right value', () {
      expect(Max(value: value, extra: "2").validator(), null);
    });
    test('max with wrong value', () {
      expect(Max(value: value, extra: "1").validator(), isA<String>());
    });
    test('gt with right value', () {
      expect(GreaterThan(value: value, extra: "12").validator(), null);
    });
    test('gt with wrong value', () {
      expect(GreaterThan(value: value, extra: "43").validator(), isA<String>());
    });

    test('gte with right value', () {
      expect(GreaterThanOrEqual(value: value, extra: "23").validator(), null);
    });
    test('gte with wrong value', () {
      expect(GreaterThanOrEqual(value: value, extra: "45").validator(),
          isA<String>());
    });

    test('lt with right value', () {
      expect(LessThan(value: value, extra: "34").validator(), null);
    });
    test('lt with wrong value', () {
      expect(LessThan(value: value, extra: "12").validator(), isA<String>());
    });

    test('lte with right value', () {
      expect(LessThanOrEqual(value: value, extra: "23").validator(), null);
    });
    test('lte with wrong value', () {
      expect(LessThanOrEqual(value: value, extra: "13").validator(),
          isA<String>());
    });
  });

  group("Test for other rules", () {
    // List<String> others = ['alpha_num', 'in', 'not_in', 'regex', 'email', 'ip'];
    test('alpha_num with right value', () {
      expect(AlphaNumeric(value: "qazeem123").validator(), null);
    });
    test('alpha_num with wrong value', () {
      expect(AlphaNumeric(value: "qazeem123./?").validator(), isA<String>());
    });
    test('in with right value', () {
      String value = "man";
      String extra = "man,qazeem,abiodun";
      expect(In(value: value, extra: extra).validator(), null);
    });
    test('in with wrong value', () {
      String value = "man";
      String extra = "ades,qazeem,abiodun";
      expect(In(value: value, extra: extra).validator(), isA<String>());
    });
    test('not_in with right value', () {
      String value = "hello";
      String extra = "man,qazeem,abiodun";
      expect(NotIn(value: value, extra: extra).validator(), null);
    });
    test('not_in with wrong value', () {
      String value = "hello";
      String extra = "hello,qazeem,abiodun";
      expect(NotIn(value: value, extra: extra).validator(), isA<String>());
    });

    test('email with right value', () {
      expect(Email(value: "abiodundotdev@gmail.com").validator(), null);
    });
    test('email with wrong value', () {
      expect(Email(value: "qazeem.com").validator(), isA<String>());
    });
    test('ip with right value', () {
      expect(IpAddress(value: "192.168.0.1").validator(), null);
    });
    test('ip with wrong value', () {
      expect(IpAddress(value: "qazeem.com").validator(), isA<String>());
    });
    test('regex with right value', () {
      const extra = r"[a-zA-Z0-9]{2,8}";
      expect(RegEx(value: "qazem1236", extra: extra).validator(), null);
    });
    test('regex with wrong value', () {
      expect(RegEx(value: "q12", extra: r"[a-zA-Z0-9]{5,8}").validator(),
          isA<String>());
    });
  });
}
