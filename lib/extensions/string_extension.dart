import 'package:flutter_laravel_form_validation/validator.dart';

import 'base_extension.dart';

extension FormValidatorString on String {
  ValidatorX validate({
    Map<String, String>? customMessages,
    String? attribute,
  }) {
    assert(split("|").isNotEmpty, "Valide cannot be called on an empty string");
    return Valiadator()
        .make(split("|"), attribute: attribute, customMessages: customMessages);
  }

  ///Short for of validate
  ValidatorX get v {
    assert(isNotEmpty, "Validator cannot be called on an empty string");
    return Valiadator().make(split("|"));
  }
}
