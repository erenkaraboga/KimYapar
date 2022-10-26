import 'package:flutter/material.dart';
import 'package:kimyapar/core/constants/styles/text.dart';

import '../../languages/tr.dart';
import '../colors.dart';
import '../icons.dart';

mailFieldd() {
  return InputDecoration(
      suffix: AppIcons.envelope,
      labelText: Tr.mail,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ));
}

passFieldd() {
  return InputDecoration(
      suffix: AppIcons.eyeSlash,
      labelText: Tr.pass,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));
}

orderBox(String text) {
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      labelText: text,
      labelStyle: addOrder());
}

cardNumberDecoration() {
  return InputDecoration(
    labelText: 'Kart Numarası',
    hintText: 'XXXX XXXX XXXX XXXX',
    hintStyle: creditCardFieldsStyle(),
    labelStyle: creditCardFieldsStyle(),
    focusedBorder: creditCardFieldBorder(),
    enabledBorder: creditCardFieldBorder(),
  );
}

cvvNumberDecoration() {
  return InputDecoration(
    hintStyle: creditCardFieldsStyle(),
    labelStyle: creditCardFieldsStyle(),
    focusedBorder: creditCardFieldBorder(),
    enabledBorder: creditCardFieldBorder(),
    labelText: 'CVV',
    hintText: 'XXX',
  );
}

cardHolderDecoration() {
  return InputDecoration(
    hintStyle: creditCardFieldsStyle(),
    labelStyle: creditCardFieldsStyle(),
    focusedBorder: creditCardFieldBorder(),
    enabledBorder: creditCardFieldBorder(),
    labelText: 'Kart Sahibi',
  );
}

expiryDateDecoration() {
  return InputDecoration(
    hintStyle: creditCardFieldsStyle(),
    labelStyle: creditCardFieldsStyle(),
    focusedBorder: creditCardFieldBorder(),
    enabledBorder: creditCardFieldBorder(),
    labelText: 'Kullanım Tarihi',
    hintText: 'XX/XX',
  );
}
creditCardFieldBorder(){
  return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.orange.withOpacity(0.9),
        width: 1.0,
      ));
}
orderFieldd() {
  return InputDecoration(
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
