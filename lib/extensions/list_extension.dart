import 'package:flutter_laravel_form_validation/validator.dart';

import 'type_alias.dart';

extension FormtryValidateList on List<Object> {
  ///Validation rules in a list with label or custom messages
  tryValidateX validate({
    Map<String, String>? customMessages,
    String? attribute,
  }) {
    assert(isNotEmpty, "tryValidate cannot be called on an empty string");
    return Valiadator()
        .make(this, attribute: attribute, customMessages: customMessages);
  }

  ///Validation rules in a list, short form without label or custom messages
  tryValidateX get v {
    assert(isNotEmpty, "tryValidate cannot be called on an empty string");
    return Valiadator().make(this);
  }
}
