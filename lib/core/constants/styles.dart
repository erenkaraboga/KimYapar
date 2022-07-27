import 'package:flutter/material.dart';
import 'package:kimyapar/core/constants/icons.dart';
import 'package:kimyapar/core/languages/tr.dart';

class TextStyles {
  static TextStyle nameStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle distanceStyle =
      const TextStyle(fontSize: 17, fontWeight: FontWeight.w300);
  static TextStyle rateStyle =
      const TextStyle(fontSize: 45, fontWeight: FontWeight.w400);
  static TextStyle appbarTextStyle = const TextStyle(
      wordSpacing: 1,
      letterSpacing: 2,
      fontSize: 20,
      fontWeight: FontWeight.w400);
  static const TextStyle helloStyle =
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  static const TextStyle pleaseSignIn = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );
}

class ContainerStyles {
  static BoxDecoration backround = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
        Colors.orangeAccent,
        Colors.orange.shade100,
      ]));

  static BoxDecoration backroundBox = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}

class TextFieldStyles {
  static InputDecoration MailField = InputDecoration(
      suffix: AppIcons.envelope,
      labelText: Tr.mail,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ));
}
