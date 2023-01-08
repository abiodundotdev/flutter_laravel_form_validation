import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class UpperCase implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  UpperCase({
    required this.value,
    this.attribute,
    this.customMessage,
  });

  @override
  String? tryValidate() {
    if (value.toUpperCase() != value) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.uppercase, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => UpperCase(value: value);
}
