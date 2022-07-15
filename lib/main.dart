import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kimyapar/constants/colors.dart';
import 'package:kimyapar/core/chef.dart';
import 'package:kimyapar/core/chefs.dart';

import 'package:kimyapar/home.dart';

import 'services/getUser.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: ChefsList(),
    );
  }
}
