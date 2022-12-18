import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class Email implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  Email({
    required this.value,
    this.attribute,
    this.customMessage,
  });
  @override
  String? validator() {
    RegExp exp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
        caseSensitive: false);
    if (!exp.hasMatch(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.email, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => Email(value: value);
}
