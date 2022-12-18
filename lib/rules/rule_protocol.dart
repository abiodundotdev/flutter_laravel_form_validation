abstract class RuleProtocol {
  final String value;
  RuleProtocol({required this.value});

  ///Validates the form field value
  String? validator();

  RuleProtocol get instance;
}
