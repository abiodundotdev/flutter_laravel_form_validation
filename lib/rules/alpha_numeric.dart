import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class AlphaNumeric implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  AlphaNumeric({
    required this.value,
    this.attribute,
    this.customMessage,
  });
  @override
  String? tryValidate() {
    RegExp exp = RegExp(r"^[a-zA-Z0-9]+$");
    if (!exp.hasMatch(value)) {
      if (customMessage == null) {
        return buildMessage(tryValidateStrings.alphaNum, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => AlphaNumeric(value: value);
}
