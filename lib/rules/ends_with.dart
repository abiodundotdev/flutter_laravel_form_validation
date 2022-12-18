import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class EndsWith implements RuleProtocol {
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
  String? validator() {
    if (!value.endsWith(extra)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.endWith, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
