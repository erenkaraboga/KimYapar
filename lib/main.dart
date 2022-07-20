import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kimyapar/constants/colors.dart';
import 'package:kimyapar/pages/chefsPage.dart';
import 'package:kimyapar/pages/navibarPage.dart';
import 'package:kimyapar/product/widgets/chefWidget.dart';



import 'services/getUser.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.AppBarColor),
      ),
      home: NaviBarPage(),
    );
  }
}
