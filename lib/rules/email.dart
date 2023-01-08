import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

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
  String? tryValidate() {
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
