import 'package:form_field_validator/form_field_validator.dart';

class Validate {
  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Şifre Gerekli'),
    MinLengthValidator(8, errorText: 'Şifreniz en az 8 hane olmalı'),
  ]);
  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Mail Gerekli'),
    PatternValidator('@', errorText: 'Geçerli bir mail giriniz')
  ]);
  static final phone = MultiValidator([
    RequiredValidator(errorText: 'Numara Gerekli'),
  
  ]);

  static final orderTitle = MultiValidator([
    RequiredValidator(errorText: 'Gerekli'),
    MinLengthValidator(4, errorText: 'Gerekli Alan'),
  ]);
  static final orderDetail = MultiValidator([
    RequiredValidator(errorText: 'Gerekli'),
    MinLengthValidator(10, errorText: 'Biraz daha açıklayın'),
  ]);
  static final adressTitle = MultiValidator([
    RequiredValidator(errorText: 'Gerekli'),
    MinLengthValidator(4, errorText: 'Gerekli Alan '),
  ]);
  static final adressDetail = MultiValidator([
    RequiredValidator(errorText: 'Gerekli'),
    MinLengthValidator(2, errorText: 'Adresinizi detaylandırın'),
  ]);
   static final apartment = MultiValidator([
    RequiredValidator(errorText: 'Gerekli'),
    MinLengthValidator(1, errorText: 'Gerekli alan'),
  ]);
   static final floor = MultiValidator([
    RequiredValidator(errorText: 'Gerekli'),
    MinLengthValidator(1, errorText: 'Gerekli alan'),
  ]);
   static final flat = MultiValidator([
    RequiredValidator(errorText: 'Gerekli'),
    MinLengthValidator(1, errorText: 'Gerekli alan'),
  ]);
}
