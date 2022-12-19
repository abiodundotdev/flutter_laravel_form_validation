import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class Between implements RuleProtocol {
  @override
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

  @override
  RuleProtocol get instance => Between(value: value, extra: extra);
}
