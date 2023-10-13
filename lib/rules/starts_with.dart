import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class StartsWith implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  StartsWith(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});
  @override
  String? tryValidate() {
    if (!value.startsWith(extra)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.startsWith, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
