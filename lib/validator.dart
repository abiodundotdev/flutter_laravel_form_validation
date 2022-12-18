library validator;

import 'package:laravel_validator/rules/rules.dart';
import 'extensions/base_extension.dart';

class Valiadator {
  ///The numeric related validation rules.
  List<String> numericRules = ['numeric', 'integer', 'double'];

  ///The size related validation rules.
  List<String> sizeRules = ['between', 'min', 'max', 'gt', 'lt', 'lte', 'lte'];

  ///The size related validation rules.
  List<String> stringRules = ['starts_with', 'ends_with'];

  ///The validation rules that imply the field is required
  List<String> implicitRules = ['required'];

  ///The validation rules that imply the field is required
  List<String> others = ['alpha_num'];

  ValidatorX make(List<Object> rules,
      {String? attribute, Map<String, String>? customMessages}) {
    final joinedRules = [
      ...numericRules,
      ...sizeRules,
      ...implicitRules,
      ...stringRules,
      ...others
    ];
    return (String? value) {
      String? validationMessage;
      for (var rule in rules) {
        if (validationMessage != null) return validationMessage;
        if (rule is String) {
          assert(joinedRules.contains(rule.split(":")[0]),
              "$rule is not a defined rule kindly check for spellings or error");
          validationMessage = _validate(
            rule.split(":")[0],
            value!,
            rule.split(":").length > 1 ? rule.split(":")[1] : null,
            attribute,
            customMessages != null ? customMessages[rule] : null,
          );
        }
      }
      return validationMessage;
    };
  }

  String? _validate(String rule, String value, String? extra, String? attribute,
      String? cutsomMessage) {
    late RuleProtocol ruleInstance;
    switch (rule) {
      case "required":
        ruleInstance = Required(value: value, attribute: attribute);
        break;
      case "starts_with":
        ruleInstance =
            StartsWith(value: value, extra: extra!, attribute: attribute);
        break;
      case "ends_with":
        ruleInstance =
            EndsWith(value: value, extra: extra!, attribute: attribute);
        break;
      case "between":
        ruleInstance =
            Between(value: value, extra: extra!, attribute: attribute);
        break;
      case "max":
        ruleInstance = Max(value: value, extra: extra!, attribute: attribute);
        break;
      case "min":
        ruleInstance = Min(value: value, extra: extra!, attribute: attribute);
        break;
      case "in":
        ruleInstance = In(value: value, extra: extra!, attribute: attribute);
        break;
      case "not_in":
        ruleInstance = NotIn(value: value, extra: extra!, attribute: attribute);
        break;
      case "gt":
        ruleInstance =
            GreaterThan(value: value, extra: extra!, attribute: attribute);
        break;
      case "gte":
        ruleInstance = GreaterThanOrEqual(
            value: value, extra: extra!, attribute: attribute);
        break;
      case "lt":
        ruleInstance =
            LessThan(value: value, extra: extra!, attribute: attribute);
        break;
      case "lte":
        ruleInstance =
            LessThanOrEqual(value: value, extra: extra!, attribute: attribute);
        break;
      case "double":
        ruleInstance = Double(value: value, attribute: attribute);
        break;
      case "interger":
        ruleInstance = Integer(value: value, attribute: attribute);
        break;
      case "numeric":
        ruleInstance = Numeric(value: value, attribute: attribute);
        break;
      case "alpha_num":
        ruleInstance = Integer(value: value, attribute: attribute);
        break;
      default:
        ruleInstance = Required(value: value, attribute: attribute);
    }
    return ruleInstance.validator();
  }
}
