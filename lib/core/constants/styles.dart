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
  static const forgotPassStyle = TextStyle(color: Colors.deepOrange);
  static const loginButtonStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
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
  static BoxDecoration LoginBox = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      color: Colors.deepOrangeAccent);
}

class TextFieldStyles {
  static InputDecoration MailField = InputDecoration(
      suffix: AppIcons.envelope,
      labelText: Tr.mail,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ));
  static InputDecoration PassField = InputDecoration(
      suffix: AppIcons.eyeSlash,
      labelText: Tr.pass,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ));
  static InputDecoration orderField = InputDecoration(
      hintStyle: const TextStyle(color: Colors.deepOrange),
      hoverColor: Colors.deepOrange,
      suffix: AppIcons.order,
      labelStyle: const TextStyle(color: Colors.deepOrange),
      labelText: Tr.order,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.orange,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: Colors.orangeAccent, width: 1.5),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ));
}
/*InputDecoration(
                labelText: "Enter Email",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
) */