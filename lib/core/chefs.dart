import 'package:flutter/material.dart';
import 'package:kimyapar/core/chef.dart';

class ChefsList extends StatefulWidget {
  const ChefsList({Key? key}) : super(key: key);

  @override
  State<ChefsList> createState() => _ChefsListState();
}

class _ChefsListState extends State<ChefsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ChefContainer(),
          ChefContainer(),
          ChefContainer(),
          ChefContainer(),
        ],
      ),
    );
  }
}
