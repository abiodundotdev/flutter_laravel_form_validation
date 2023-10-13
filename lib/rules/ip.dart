import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class IpAddress implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;

  IpAddress({required this.value, this.attribute, this.customMessage});
  @override
  String? tryValidate() {
    RegExp exp = RegExp(
        r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$",
        caseSensitive: false,
        multiLine: false);
    if (!exp.hasMatch(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.ip, attribute);
      }
      return customMessage;
    }
    return null;
  }
}
