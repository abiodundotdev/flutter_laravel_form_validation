// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  group("Test for widget", () {
    late Finder usernameField;
    late Finder emailField;
    late Finder fullNameField;
    late Finder submitBtn;

    setUp(() {
      usernameField = find.byKey(const Key("username"));
      fullNameField = find.byKey(const Key("fullname"));
      emailField = find.byKey(const Key("email"));
      submitBtn = find.byType(ElevatedButton);
    });

    testWidgets('Test for required rule', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(usernameField, findsOneWidget);
      expect(fullNameField, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(submitBtn, findsOneWidget);

      await tester.enterText(usernameField, "");
      await tester.enterText(emailField, "");
      await tester.enterText(fullNameField, "");
      await tester.tap(submitBtn);
      await tester.pump();

      expect(find.text('This field is required'), findsNWidgets(3));
    });
  });
}
