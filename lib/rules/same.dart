import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class Same implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  Same(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});
  @override
  String? validator() {
    if (value != extra) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.same, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => Same(value: value, extra: extra);
}
