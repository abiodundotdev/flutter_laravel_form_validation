import 'package:flutter_laravel_form_validation/validator.dart';

import 'type_alias.dart';

extension FormtryValidateString on String {
  ///Validation rules in a string with label or custom messages
  tryValidateX validate({
    Map<String, String>? customMessages,
    String? attribute,
  }) {
    assert(split("|").isNotEmpty, "Valide cannot be called on an empty string");
    return Valiadator()
        .make(split("|"), attribute: attribute, customMessages: customMessages);
  }

  ///Validation rules in a string, short form without label or custom messages
  tryValidateX get v {
    assert(isNotEmpty, "tryValidate cannot be called on an empty string");
    return Valiadator().make(split("|"));
  }
}
