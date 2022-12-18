import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class UpperCase implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  UpperCase({
    required this.value,
    this.attribute,
    this.customMessage,
  });

  @override
  String? validator() {
    if (value.toUpperCase() != value) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.uppercase, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => UpperCase(value: value);
}
