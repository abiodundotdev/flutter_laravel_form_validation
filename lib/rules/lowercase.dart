import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class LowerCase implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  LowerCase({
    required this.value,
    this.attribute,
    this.customMessage,
  });

  @override
  String? tryValidate() {
    if (value.toLowerCase() != value) {
      if (customMessage == null) {
        return buildMessage(tryValidateStrings.lowercase, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => LowerCase(value: value);
}
