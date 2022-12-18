import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class LowerCase implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  LowerCase({
    required this.value,
    this.attribute,
    this.customMessage,
  });

  @override
  String? validator() {
    if (value.toLowerCase() != value) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.lowercase, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => LowerCase(value: value);
}
