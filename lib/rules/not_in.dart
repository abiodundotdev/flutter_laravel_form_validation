import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class NotIn implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  NotIn(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? validator() {
    assert(extra.isNotEmpty, "Values to check from is required");
    final extraToList = extra.split(",");
    if (extraToList.contains(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.max, attribute);
      }
      return customMessage;
    }
    return null;
  }
}
