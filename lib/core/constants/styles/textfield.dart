import 'package:flutter/material.dart';

import '../../languages/tr.dart';
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
