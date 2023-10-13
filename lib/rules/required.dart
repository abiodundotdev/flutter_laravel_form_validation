import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class Required implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  Required({required this.value, this.attribute, this.customMessage});
  @override
  String? tryValidate() {
    if (value.isEmpty) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.required, attribute);
      }
      return customMessage;
    }
    return null;
  }
}
