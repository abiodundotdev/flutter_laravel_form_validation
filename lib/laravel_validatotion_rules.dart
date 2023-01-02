///Class to access the validation rules
class FLValidator {
  //Implict
  static String required = "required";

  //Numeric
  static String numeric = "numeric";
  static String interger = "integer";
  static String double = "integer";

  //Size.

  static String between(num min, num max) => "between:$min,$max";
  static String min(num length) => "min:$length";
  static String max(num length) => "max:$length";
  static String gt(num number) => "gt:$number";
  static String gte(num number) => "gte:$number";
  static String lt(num number) => "lt:$number";
  static String lte(num number) => "lte:$number";

  //String

  static String startsWith(dynamic pattern) => "starts_with:$pattern";
  static String endsWith(dynamic pattern) => "ends_with:$pattern";
  static String lowercase = "lowercase";
  static String uppercase = "uppercase";

//Others

  static String alphaNumeric = "alpha_num";
  static String email = "email";
  static String ip = "ip";
  static String url = "url";
  static String inItems(List<dynamic> items) =>
      "in:${items.toString().replaceAll(RegExp(r'[\]\[]'), "")}";
  static String notInItems(List<dynamic> items) =>
      "not_in:${items.toString().replaceAll(RegExp(r'[\]\[]'), "")}";
  static String regEx(String pattern) => "regex:$pattern";

  // //custom
  // static String custom(String? Function(String) tryValidate){

  // }
}
