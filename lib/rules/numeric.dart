import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

///For number validation
class Numeric implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  Numeric({required this.value, this.attribute, this.customMessage});
  @override
  String? tryValidate() {
    final parsedValue = num.tryParse(value);
    if (parsedValue == null) {
      if (customMessage == null) {
        return buildMessage(tryValidateStrings.numeric, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => Numeric(value: value);
}
