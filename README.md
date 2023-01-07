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
        validator : ['required','max:10','uppercase'].v,
    ),
```

## Validation rules in a list using the FLValidator class, short form without label or custom messages

```dart
    TextFormField(
        validator : [FLValidator.required,FLValidator.max(10),FLValidator.uppercase].v,
    ),
```

## Validation rules in a string,  short form without label or custom messages
```dart
    TextFormField(
        validator : "required|max:10|uppercase".v,
    ),
```

## Validation rules in a list with label or custom messages
```dart
 TextFormField(
        tryValidate: ['required','max:10','uppercase',].validate(attribute: 'Username',
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
        tryValidate: "required|max:10|uppercase".validate(attribute: 'Username',
        customMessages: {
            'required': "You must input your username",
            'max': "The length must be 10",
             'uppercase': "Only uppercase is allowed"
            },
    ),
```
## Rules

 <table>
    <thead>
      <tr>
        <th>Class property</th>
        <th>String </th>
        <th>Description</th>
        <th>Example</th>
      </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>FLValidator.required</code></td>
            <td>required</td>
            <td>For making sure a form field value is required</td>
            <td>['required'] or  'required' or [FLValidator.required]</td>
        </tr>
          <tr>
            <td><code>FLValidator.numeric</code></td>
            <td>numeric</td>
            <td>For making sure a form field value is numeric</td>
            <td>['numeric'] or  'numeric' or [FLValidator.numeric]</td>
        </tr>
         <tr>
            <td><code>FLValidator.integer</code></td>
            <td>interger</td>
            <td>For making sure a form field value is an interger</td>
            <td>['interger'] or  'interger' or [FLValidator.interger]</td>
        </tr>
        <tr>
            <td><code>FLValidator.double</code></td>
            <td>double</td>
            <td>For making sure a form field value is a double</td>
            <td>['double'] or  'double' or [FLValidator.double]</td>
        </tr>
        <tr>
            <td><code>FLValidator.between(min,max)</code></td>
            <td>between(min,max)</td>
            <td>For making sure a form field value is between the of min and max</td>
            <td>['between:2,8'] or  'between(2,8)' or [FLValidator.between(2,8)</td>
        </tr>
         <tr>
            <td><code>FLValidator.max(length)</code></td>
            <td>max:length</td>
            <td>For making sure a form field value length is limited to the max length </td>
            <td>['max:5'] or  'max:5' or [FLValidator.max(5)</td>
        </tr>
         <tr>
            <td><code>FLValidator.min(length)</code></td>
            <td>min:length</td>
            <td>For making sure a form field value length is limited to the min length </td>
            <td>['min:5'] or  'min:5' or [FLValidator.min(5)</td>
        </tr>
        <tr>
            <td><code>FLValidator.gt(number)</code></td>
            <td>gt:number</td>
            <td>For making sure a form field value is greater than the number specified</td>
            <td>['gt:10'] or  'gt:10' or [FLValidator.gt(10)</td>
        </tr>
        <tr>
            <td><code>FLValidator.lt(number)</code></td>
            <td>lt:number</td>
            <td>For making sure a form field value is less than the number specified</td>
            <td>['lt:10'] or  'lt:10' or [FLValidator.lt(10)</td>
        </tr>
        <tr>
            <td><code>FLValidator.gte(number)</code></td>
            <td>gte:number</td>
            <td>For making sure a form field value is greater than or equal to the number specified</td>
            <td>['gte:10'] or  'gte:10' or [FLValidator.gte(10)</td>
        </tr>
        <tr>
            <td><code>FLValidator.lte(number)</code></td>
            <td>lte:number</td>
            <td>For making sure a form field value is less than or equal to the number specified</td>
            <td>['lte:10'] or  'lte:10' or [FLValidator.lte(10)</td>
        </tr>
        <tr>
            <td><code>FLValidator.uppercase</code></td>
            <td>uppercase</td>
            <td>For making sure a form field value is uppercase</td>
            <td>['uppercase'] or  'uppercase' or uppercase</td>
        </tr>
        <tr>
            <td><code>FLValidator.lowercase</code></td>
            <td>lowercase</td>
            <td>For making sure a form field value is lowercase</td>
            <td>['lowercase'] or  'lowercase' or lowercase</td>
        </tr>
        <tr>
            <td><code>FLValidator.startsWith(value)</code></td>
            <td>starts_with:value</td>
            <td>For making sure a form field value starts with the specified value</td>
            <td>['starts_with:man'] or  'starts_with:man' or FLValidator.startsWith(man)</td>
        </tr>
        <tr>
            <td><code>FLValidator.endsWith(value)</code></td>
            <td>ends_with:value</td>
            <td>For making sure a form field value ends with the specified value</td>
            <td>['ends_with:man'] or  'ends_with:man' or FLValidator.endsWith(man)</td>
        </tr>
        <tr>
            <td><code>FLValidator.alphaNum</code></td>
            <td>alpha_num</td>
            <td>For making sure a form field value is alpha numeric </td>
            <td>['alpha_num'] or  'alpha_num' or FLValidator.alphaNum</td>
        </tr>
        <tr>
            <td><code>FLValidator.inItems(List items)</code></td>
            <td>in:</td>
            <td>For making sure a form field value exist in a list </td>
            <td>['in:he,she,it'] or  'in:he,she,it' or FLValidator.inItems([he,she,it])</td>
        </tr>
        <tr>
            <td><code>FLValidator.notInItems(List items)</code></td>
            <td>not_in:</td>
            <td>For making sure a form field value does exist in a list </td>
            <td>['not_in:he,she,it'] or  'not_in:he,she,it' or FLValidator.notInItems([he,she,it])</td>
        </tr>
        <tr>
            <td><code>FLValidator.regEx(pattern)</code></td>
            <td>regex:pattern</td>
            <td>For making sure a form field value match the specified regular expression pattern</td>
            <td>['regex:pattern'] or  'regex:pattern' or FLValidator.regEx(pattern)</td>
        </tr>
        <tr>
            <td><code>FLValidator.email</code></td>
            <td>email</td>
            <td>For making sure a form field value is an email </td>
            <td>['email'] or  'email' or FLValidator.email</td>
        </tr>
        <tr>
            <td><code>FLValidator.ip</code></td>
            <td>ip</td>
            <td>For making sure a form field value is an ip address</td>
            <td>['ip'] or  'ip' or FLValidator.ip</td>
        </tr>
         <tr>
            <td><code>FLValidator.url</code></td>
            <td>url</td>
            <td>For making sure a form field value is a url</td>
            <td>['url'] or  'url' or FLValidator.url</td>
        </tr>
    </tbody>
  </table>

## Additional information
Currently working on custom rules validation, was inlcuded, but later remove flutter does not support dart reflection, another way around this is still a work in progress

Also, localization is a work in progress

## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is
missing a feature, please raise a ticket on Github and I'll look into it.
Pull request are also welcome.
