import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class RegEx implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  RegEx(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});
  @override
  String? validator() {
    RegExp exp = RegExp(r"" + extra);
    if (!exp.hasMatch(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.url, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => RegEx(value: value, extra: extra);
}
