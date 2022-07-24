import 'package:flutter/material.dart';
import 'package:kimyapar/core/languages/tr.dart';

import 'package:kimyapar/product/widgets/mapInfoWindow.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';

class NaviBarPage extends StatefulWidget {
  const NaviBarPage({Key? key}) : super(key: key);

  @override
  State<NaviBarPage> createState() => _NaviBarPageState();
}

final screens = [const MapSelect(),MyWidget()];
final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
      icon: Icon(Icons.location_on_outlined), label: Tr.map),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label:Tr.chefs)
];

class _NaviBarPageState extends State<NaviBarPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
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
