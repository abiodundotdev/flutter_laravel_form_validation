import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class Min implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  Min(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? validator() {
    final parsedExtra = num.tryParse(extra);
    if (parsedExtra == null) return "Max value not a valid number";
    if (value.length > parsedExtra) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.max, attribute);
      }
      return customMessage;
    }
    return null;
  }
}
