import 'package:laravel_validator/validator.dart';

import 'base_extension.dart';

extension FormValidatorList on List<Object> {
  ///Validate the form field
  ValidatorX validate({
    Map<String, String>? customMessages,
    String? attribute,
  }) {
    assert(isNotEmpty, "Validator cannot be called on an empty string");
    return Valiadator()
        .make(this, attribute: attribute, customMessages: customMessages);
  }

  ///Short for of validate
  ValidatorX get v {
    assert(isNotEmpty, "Validator cannot be called on an empty string");
    return Valiadator().make(this);
  }
}
