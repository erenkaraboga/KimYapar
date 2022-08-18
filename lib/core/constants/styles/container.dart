import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../colors.dart';

BoxDecoration backround() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
        Colors.orangeAccent,
        Colors.orange.shade100,
      ]));
}

backroundBox() {
  return const BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15)));
}

foodOrderBox() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.2),
        offset: const Offset(0, 3),
        blurRadius: 6,
      ),
    ],
  );
}

chefAvatarBox() {
  return const BoxDecoration(
    color: Colors.transparent,
    shape: BoxShape.circle,
  );
}

orderStatusBox() {
  return BoxDecoration(
    border: Border.all(
      color: AppColors.primary,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(50),
  );
}

loginBox() {
  return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      color: Colors.deepOrangeAccent);
}
