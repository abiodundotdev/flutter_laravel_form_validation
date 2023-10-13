import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

///For number validation
class Integer implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  Integer({required this.value, this.attribute, this.customMessage});
  @override
  String? tryValidate() {
    final parsedValue = double.tryParse(value);
    if (parsedValue == null) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.integer, attribute);
      }
      return customMessage;
    }
    return null;
  }
}
