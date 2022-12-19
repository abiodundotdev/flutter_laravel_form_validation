# Flutter Laravel Form Validation

A simplified dart extension based flutter form validation . Inspired by Laravel Validation.

## 🎖 Installing

```yaml
dependencies:
  flutter_laravel_form_validation : ^1.0.0
```

### ⚡️ Import
```dart
import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';
```

## 🎮 How To Use

## Validation rules in a list, short form without label or custom messages

```dart
    TextFormField(
        validator: ['required','max:10','uppercase'].v,
    ),
```

## Validation rules in a string,  short form without label or custom messages
```dart
    TextFormField(
        validator: "required|max:10|uppercase".v,
    ),
```

## Validation rules in a list with label or custom messages
```dart
 TextFormField(
        validator: ['required','max:10','uppercase',].validate(attribute: 'Username',
        customMessages: {
            'required': "You must input your username",
            'max': "The length must be 10",
             'uppercase': "Only uppercase is allowed"
            },
    ),
```

## Validation rules in a list with label or custom messages
```dart
 TextFormField(
        validator: "required|max:10|uppercase".validate(attribute: 'Username',
        customMessages: {
            'required': "You must input your username",
            'max': "The length must be 10",
             'uppercase': "Only uppercase is allowed"
            },
    ),
```

## Additional information
Currently working on custom rules validation, was inlcuded, but lated remove flutter does not support relection, another way around this is still work in progress

Also, localization is a work in progress

## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is
missing a feature, please raise a ticket on Github and I'll look into it.
Pull request are also welcome.
