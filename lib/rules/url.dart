import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class URL implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  URL({
    required this.value,
    this.attribute,
    this.customMessage,
  });
  @override
  String? validator() {
    RegExp exp = RegExp(r"^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$");
    if (!exp.hasMatch(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.url, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => URL(value: value);
}
