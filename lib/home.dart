import 'package:flutter/material.dart';
import 'package:kimyapar/constants/colors.dart';
import 'package:kimyapar/constants/styles.dart';
import 'package:kimyapar/languages/tr.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr.appbarTitle, style: Styles.appbarTextStyle),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

class Styles {
  static TextStyle appbarTextStyle = const TextStyle(
      wordSpacing: 1,
      letterSpacing: 2,
      fontSize: 10,
      fontWeight: FontWeight.w600);
}
