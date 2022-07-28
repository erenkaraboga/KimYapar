import 'package:flutter/material.dart';
import 'package:kimyapar/product/widgets/chefs/chefWidget.dart';
import 'package:kimyapar/view/chefs/model/chefmodel.dart';

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
          ChefContainer(
              chefModel:
                  ChefModel('assets/images/eren.jpg', "Eren Karaboğa", 200, 1)),
          ChefContainer(
              chefModel:
                  ChefModel('assets/images/eren.jpg', "Eren Karaboğa", 200, 2)),
          ChefContainer(
              chefModel:
                  ChefModel('assets/images/eren.jpg', "Eren Karaboğa", 200, 3)),
          ChefContainer(
              chefModel:
                  ChefModel('assets/images/eren.jpg', "Eren Karaboğa", 200, 4)),
        ],
      ),
    );
  }
}
