import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class Between implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  Between(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? validator() {
    final parsedValue = num.tryParse(value);
    if (parsedValue == null) return "Not a valid number";
    final splitedExtra = extra.split(",");
    final min = int.parse(splitedExtra[0]);
    final max = int.parse(splitedExtra[1]);
    if (!((parsedValue >= min) && (parsedValue >= max))) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.between, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
