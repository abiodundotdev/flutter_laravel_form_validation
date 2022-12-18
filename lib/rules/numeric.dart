import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

///For number validation
class Numeric implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  Numeric({required this.value, this.attribute, this.customMessage});
  @override
  String? validator() {
    final parsedValue = num.tryParse(value);
    if (parsedValue == null) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.numeric, attribute);
      }
      return customMessage;
    }
    return null;
  }
}
