import 'package:flutter/material.dart';
import 'package:kimyapar/core/chef.dart';
import 'package:kimyapar/models/chefmodel.dart';

class ChefsList extends StatefulWidget {
  const ChefsList({Key? key}) : super(key: key);

  @override
  State<ChefsList> createState() => _ChefsListState();
}

class _ChefsListState extends State<ChefsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ChefContainer(
                chefModel: ChefModel(
                    "assets/images/dilara.jpg", "Dilara Özdemir", 100, 5.0)),
            ChefContainer(
                chefModel: ChefModel(
                    "assets/images/eren.jpg", "Eren Karaboğa", 200, 3.0)),
          ],
        ),
      ),
    );
  }

  void fillModel() {}
}
