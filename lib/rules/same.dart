import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class Same implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  Same(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});
  @override
  String? validator() {
    if (value != extra) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.same, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
