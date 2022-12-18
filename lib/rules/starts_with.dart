import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

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
  String? validator() {
    if (!value.startsWith(extra)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.startsWith, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => StartsWith(value: value, extra: extra);
}
