///Laravel validation syntax in dart

library validator;

class ValidatorStrings {
  static String required = "This field is required";
  static String min = "This field is should be at least extra characters";
  static String same = "This field is is not the same as extra";
  static String max = "This field is cannot be more than extra characters";
  static String endWith = "This field must end with extra";
  static String startsWith = "This field must start with extra";
  static String contain = "This field must contains one of your words";
  static String email = "This field must be a valid email";
  static String numeric = "This field must be a valid number";
  static String integer = "This field must be integer";
  static String double = "This field must be double";
  static String alphaNum = "This field must contains only letters and numbers";
  static String between = "This field must be between extra and max";
  static String contains = "This field must contains one of your worlds";
  static String haveAlpha = "This field must have alpha in it";
  static String ip = "This field must be a valid IP";
  static String inRes = "This field must be in [extra]";
  static String notIn = "This field must be not be in extra";
  static String lt = "This field must be less than extra";
  static String gt = "This field must be less than extra";
  static String lte = "This field must be less than or equal to extra";
  static String gte = "This field must be less than or equal to extra";
  static String url = "This field must be a valid url";
}
