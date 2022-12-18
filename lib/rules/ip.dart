import 'package:laravel_validator/constants/strings.dart';
import 'package:laravel_validator/helper.dart';
import 'package:laravel_validator/rules/rule_protocol.dart';

class IpAddress implements RuleProtocol {
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  IpAddress(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});
  @override
  String? validator() {
    RegExp exp = RegExp(
        r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$",
        caseSensitive: false,
        multiLine: false);
    if (!exp.hasMatch(value)) {
      if (customMessage == null) {
        return buildMessage(ValidatorStrings.ip, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }
}
