import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class GreaterThan implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  GreaterThan(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? validator() {
    final parsedValue = num.tryParse(value);
    final parsedExtra = num.tryParse(extra);
    if (parsedValue == null || parsedExtra == null) return "Not a valid number";
    if (!(parsedValue > parsedExtra)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.gt, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
