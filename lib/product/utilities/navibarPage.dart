import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimyapar/core/constants/colors.dart';
import 'package:kimyapar/core/languages/tr.dart';

import 'package:kimyapar/product/widgets/map/mapInfoWindow.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';

class NaviBarPage extends StatefulWidget {
  const NaviBarPage({Key? key}) : super(key: key);

  @override
  State<NaviBarPage> createState() => _NaviBarPageState();
}

final screens = [MapSelect(), MyWidget()];
final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.location,
        color: AppColors.primary,
      ),
      label: Tr.map),
  BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.group,
        size: 35,
        color: AppColors.primary,
      ),
      label: Tr.chefs)
];

class _NaviBarPageState extends State<NaviBarPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: items,
      ),
      body: IndexedStack(
        children: screens,
        index: currentIndex,
      ),
    );
  }
}
