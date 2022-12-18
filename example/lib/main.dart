import 'package:flutter/material.dart';
import 'package:laravel_validator/extensions/extensions.dart';

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
                validator: ['required', 'in:man,house,goat'].v,
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: 'required|max:5'.v,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: handleSubmit,
                child: Text("Submit"),
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
