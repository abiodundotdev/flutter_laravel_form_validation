import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class EndsWith implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  EndsWith(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? tryValidate() {
    if (!value.endsWith(extra)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.endsWith, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
