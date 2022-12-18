import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class Required implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  Required({required this.value, this.attribute, this.customMessage});
  @override
  String? validator() {
    if (value.isEmpty) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.required, attribute);
      }
      return customMessage;
    }
    return null;
  }
}
