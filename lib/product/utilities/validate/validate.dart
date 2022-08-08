import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
class Validate{
  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Şifre Gerekli'),
    MinLengthValidator(8, errorText: 'Şifreniz en az 8 hane olmalı'),
  ]);
  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Mail Gerekli'),
    PatternValidator('@', errorText: 'Geçerli bir mail giriniz')
  ]);
}