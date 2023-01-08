import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_laravel_form_validation/rules/rules.dart';

void main() {
  group("Test for implicit rules", () {
    // List<String> implicitRules = ['required'];
    test('required with value', () {
      String value = "Qazeem Qudus";
      expect(Required(value: value).tryValidate(), null);
    });
    test('required without value', () {
      expect(Required(value: "").tryValidate(), isA<String>());
    });
  });

  group("Test for numeric rules", () {
    // List<String> numericRules = ['numeric', 'integer', 'double'];
    test('numeric with value number | numeric', () {
      String value = "23.23";
      expect(Numeric(value: value).tryValidate(), null);
    });
    test('numeric without number | numeric', () {
      expect(Numeric(value: "qazeem").tryValidate(), isA<String>());
    });

    test('double with value number | double', () {
      String value = "23.23";
      expect(Double(value: value).tryValidate(), null);
    });
    test('double without number | double', () {
      expect(Double(value: "qazeem").tryValidate(), isA<String>());
    });

    test('integer with value number', () {
      String value = "23";
      expect(Integer(value: value).tryValidate(), null);
    });
    test('integer without number', () {
      expect(Integer(value: "qazeem").tryValidate(), isA<String>());
    });
  });

  group("Test for string rules", () {
    // List<String> stringRules = ['starts_with', 'ends_with', 'lowercase',   'uppercase' ];
    String value = "abiodundotdev";
    test('ends_with right value', () {
      expect(EndsWith(value: value, extra: "dev").tryValidate(), null);
    });
    test('ends_with wrong value', () {
      expect(EndsWith(value: value, extra: "def").tryValidate(), isA<String>());
    });

    test('starts_with right value', () {
      expect(StartsWith(value: value, extra: "abi").tryValidate(), null);
    });
    test('starts_with wrong value', () {
      expect(
          StartsWith(value: value, extra: "adis").tryValidate(), isA<String>());
    });

    test('same right value', () {
      expect(Same(value: value, extra: value).tryValidate(), null);
    });
    test('same wrong value', () {
      expect(Same(value: value, extra: "adis").tryValidate(), isA<String>());
    });

    test('upppercase with right value', () {
      expect(UpperCase(value: value.toUpperCase()).tryValidate(), null);
    });
    test('uppercase with wrong value', () {
      expect(UpperCase(value: value).tryValidate(), isA<String>());
    });

    test('lowerCase with right value', () {
      expect(LowerCase(value: value.toLowerCase()).tryValidate(), null);
    });
    test('lowerCase with wrong value', () {
      expect(
          LowerCase(value: value.toUpperCase()).tryValidate(), isA<String>());
    });
  });

  group("Test for size rules", () {
    // List<String> sizeRules = ['between', 'min', 'max', 'gt', 'gte', 'lt', 'lte'];
    String value = "23";
    test('between with right value', () {
      expect(Between(value: value, extra: "12,23").tryValidate(), null);
    });
    test('between with wrong value', () {
      expect(
          Between(value: value, extra: "25,70").tryValidate(), isA<String>());
    });
    test('min with right value', () {
      expect(Min(value: value, extra: "1").tryValidate(), null);
    });
    test('min with wrong value', () {
      expect(Min(value: value, extra: "5").tryValidate(), isA<String>());
    });

    test('max with right value', () {
      expect(Max(value: value, extra: "2").tryValidate(), null);
    });
    test('max with wrong value', () {
      expect(Max(value: value, extra: "1").tryValidate(), isA<String>());
    });
    test('gt with right value', () {
      expect(GreaterThan(value: value, extra: "12").tryValidate(), null);
    });
    test('gt with wrong value', () {
      expect(
          GreaterThan(value: value, extra: "43").tryValidate(), isA<String>());
    });

    test('gte with right value', () {
      expect(GreaterThanOrEqual(value: value, extra: "23").tryValidate(), null);
    });
    test('gte with wrong value', () {
      expect(GreaterThanOrEqual(value: value, extra: "45").tryValidate(),
          isA<String>());
    });

    test('lt with right value', () {
      expect(LessThan(value: value, extra: "34").tryValidate(), null);
    });
    test('lt with wrong value', () {
      expect(LessThan(value: value, extra: "12").tryValidate(), isA<String>());
    });

    test('lte with right value', () {
      expect(LessThanOrEqual(value: value, extra: "23").tryValidate(), null);
    });
    test('lte with wrong value', () {
      expect(LessThanOrEqual(value: value, extra: "13").tryValidate(),
          isA<String>());
    });
  });

  group("Test for other rules", () {
    // List<String> others = ['alpha_num', 'in', 'not_in', 'regex', 'email', 'ip'];
    test('alpha_num with right value', () {
      expect(AlphaNumeric(value: "qazeem123").tryValidate(), null);
    });
    test('alpha_num with wrong value', () {
      expect(AlphaNumeric(value: "qazeem123./?").tryValidate(), isA<String>());
    });
    test('in with right value', () {
      String value = "man";
      String extra = "man,qazeem,abiodun";
      expect(In(value: value, extra: extra).tryValidate(), null);
    });
    test('in with wrong value', () {
      String value = "man";
      String extra = "ades,qazeem,abiodun";
      expect(In(value: value, extra: extra).tryValidate(), isA<String>());
    });
    test('not_in with right value', () {
      String value = "hello";
      String extra = "man,qazeem,abiodun";
      expect(NotIn(value: value, extra: extra).tryValidate(), null);
    });
    test('not_in with wrong value', () {
      String value = "hello";
      String extra = "hello,qazeem,abiodun";
      expect(NotIn(value: value, extra: extra).tryValidate(), isA<String>());
    });

    test('email with right value', () {
      expect(Email(value: "abiodundotdev@gmail.com").tryValidate(), null);
    });
    test('email with wrong value', () {
      expect(Email(value: "qazeem.com").tryValidate(), isA<String>());
    });
    test('ip with right value', () {
      expect(IpAddress(value: "192.168.0.1").tryValidate(), null);
    });
    test('ip with wrong value', () {
      expect(IpAddress(value: "qazeem.com").tryValidate(), isA<String>());
    });
    test('regex with right value', () {
      const extra = r"[a-zA-Z0-9]{2,8}";
      expect(RegEx(value: "qazem1236", extra: extra).tryValidate(), null);
    });
    test('regex with wrong value', () {
      expect(RegEx(value: "q12", extra: r"[a-zA-Z0-9]{5,8}").tryValidate(),
          isA<String>());
    });
  });
}
