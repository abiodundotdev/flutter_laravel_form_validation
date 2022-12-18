import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class Max implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  Max(
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
        return buildMessage(ValidatorStrings.max, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
