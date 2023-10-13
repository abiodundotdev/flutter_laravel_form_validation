import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class In implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  In(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? tryValidate() {
    assert(extra.isNotEmpty, "Values to check from is required");
    final extraToList = extra.split(",");
    if (!extraToList.contains(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.inRes, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
