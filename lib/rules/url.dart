import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class URL implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  URL(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});
  @override
  String? validator() {
    RegExp exp = RegExp(r"^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$");
    if (!exp.hasMatch(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.url, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => URL(value: value, extra: extra);
}
