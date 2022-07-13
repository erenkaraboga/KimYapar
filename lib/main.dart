import 'package:flutter/material.dart';
import 'package:kimyapar/constants/colors.dart';

import 'package:kimyapar/core/chefs.dart';
import 'package:kimyapar/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.AppBarColor),
      ),
      home: const ChefsContainer(),
    );
  }
}
