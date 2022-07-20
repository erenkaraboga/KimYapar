import 'package:flutter/material.dart';
import 'package:kimyapar/pages/chefsPage.dart';
import 'package:kimyapar/pages/mapPage.dart';

class NaviBarPage extends StatefulWidget {
  const NaviBarPage({Key? key}) : super(key: key);

  @override
  State<NaviBarPage> createState() => _NaviBarPageState();
}

final screens = [ChefsList(), Map()];
final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      icon: Icon(Icons.location_on_outlined), label: "Harita"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Şefler")
];

class _NaviBarPageState extends State<NaviBarPage> {
  int currentIndex = 1;
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
