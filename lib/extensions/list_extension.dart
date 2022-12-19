import 'package:flutter_laravel_form_validation/validator.dart';

import 'type_alias.dart';

extension FormValidatorList on List<Object> {
  ///Validation rules in a list with label or custom messages
  ValidatorX validate({
    Map<String, String>? customMessages,
    String? attribute,
  }) {
    assert(isNotEmpty, "Validator cannot be called on an empty string");
    return Valiadator()
        .make(this, attribute: attribute, customMessages: customMessages);
  }

  ///Validation rules in a list, short form without label or custom messages
  ValidatorX get v {
    assert(isNotEmpty, "Validator cannot be called on an empty string");
    return Valiadator().make(this);
  }
}
