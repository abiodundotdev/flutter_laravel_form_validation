///Class to access the validation rules, this can be used as [FLValidator.rule]
///Or the rule string can be used in a List sesperated with a coma as in  [required,same:man].v or in a string and seperated with | character as in 'required|same:man'.v
///List of supported rules can be seen on https://pub.dev/packages/flutter_laravel_form_validation#rules
class FLValidator {
  FLValidator._();
  //Implict
  ///Ensure a form field value is required
  static String required = "required";

  //Numeric
  ///Ensure a form field value is numeric
  static String numeric = "numeric";

  ///Ensure a form field value is an integer
  static String interger = "integer";

  ///Ensure a form field value is a double
  static String double = "double";

  //Size.

  ///Ensure a form field value is between min,max
  static String between(num min, num max) => "between:$min,$max";

  ///Ensure a form field value length has a  [min] value specified
  static String min(num length) => "min:$length";

  ///Ensure a form field value length has a  [max] value specified
  static String max(num length) => "max:$length";

  ///Ensure a form field value is numeric and greater than [number]
  static String gt(num number) => "gt:$number";

  ///Ensure a form field value is numeric and is greater than or equal [number]
  static String gte(num number) => "gte:$number";

  ///Ensure a form field value is numeric and lesser than [number]
  static String lt(num number) => "lt:$number";

  ///Ensure a form field value is numeric and is lesser than or equal [number]

  static String lte(num number) => "lte:$number";

  //String
  ///Ensure a form field value starts with [pattern]
  static String startsWith(dynamic pattern) => "starts_with:$pattern";

  ///Ensure a form field value ends with [pattern]
  static String endsWith(dynamic pattern) => "ends_with:$pattern";

  ///Ensure a form field value is same as [other]
  static String same(dynamic other) => "same:$other";

  ///Ensure a form field value is lowercase
  static String lowercase = "lowercase";

  ///Ensure a form field value is lowercase
  static String uppercase = "uppercase";

//Others
  ///Ensure a form field value is alpha numeric
  static String alphaNumeric = "alpha_num";

  ///Ensure a form field value is an email
  static String email = "email";

  ///Ensure a form field value is an ip address
  static String ip = "ip";

  ///Ensure a form field value is a url
  static String url = "url";

  ///Ensure a form field value contains the list of [items]
  static String inItems(List<dynamic> items) =>
      "in:${items.toString().replaceAll(RegExp(r'[\]\[]'), "")}";

  ///Ensure a form field value does not in contain the list of [items]
  static String notInItems(List<dynamic> items) =>
      "not_in:${items.toString().replaceAll(RegExp(r'[\]\[]'), "")}";
  static String regEx(String pattern) => "regex:$pattern";

  // //custom
  // static String custom(String? Function(String) tryValidate){

  // }
}
