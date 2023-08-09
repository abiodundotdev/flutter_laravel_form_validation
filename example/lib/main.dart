import 'package:flutter/material.dart';
import 'package:flutter_laravel_form_validation/extensions/extensions.dart';
import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GlobalKey<FormState> formKey;
  var _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          autovalidateMode: _autoValidateMode,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                key: const Key("username"),
                validator: [
                  FLValidator.required,
                  FLValidator.max(10),
                  FLValidator.email,
                  FLValidator.uppercase,
                  FLValidator.same("man"),
                ].validate(attribute: "Username fullname"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                key: const Key("customval"),
                decoration:
                    const InputDecoration(hintText: "Custom validation"),
                validator: [FLValidator.required, customValidation].v,
              ),
              const SizedBox(height: 10),
              TextFormField(
                key: const Key("email"),
                validator: 'required|email'.v,
              ),
              const SizedBox(height: 10),
              TextFormField(
                key: const Key("fullname"),
                validator: ['required', 'uppercase'].v,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: handleSubmit,
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleSubmit() {
    final formState = formKey.currentState;
    if (formState == null) {
      return;
    }
    if (!formState.validate()) {
      _autoValidateMode = AutovalidateMode.always;
    }
  }
}

//FormFieldValidator
String? customValidation(String? value) {
  if (value == "flutterdev") {
    return "Value cannot be flutterdev";
  }
  return null;
}

///Coming soon
class UpperCase implements RuleProtocol {
  @override
  final String value;

  UpperCase({required this.value});

  @override
  String? tryValidate() {
    if (value != value.toUpperCase()) return "Field be uppercase";
    return null;
  }

  @override
  RuleProtocol get instance {
    print("Welcome to my own world and class");
    return UpperCase(value: value);
  }
}
