import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

///For number validation
class Double implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  Double({required this.value, this.attribute, this.customMessage});
  @override
  String? validator() {
    final parsedValue = double.tryParse(value);
    if (parsedValue == null) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.double, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => Double(value: value);
}
