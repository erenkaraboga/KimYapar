import 'package:flutter/material.dart';

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    leading: const BackButton(
      color: Colors.black,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
