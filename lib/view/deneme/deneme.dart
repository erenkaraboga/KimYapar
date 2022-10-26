import 'package:flutter/material.dart';
import 'package:kimyapar/view/chats/model/chefmodel.dart';

import '../../product/widgets/chefs/chefWidget.dart';

class ChefWidgets extends StatefulWidget {
  const ChefWidgets({Key? key}) : super(key: key);

  @override
  State<ChefWidgets> createState() => _ChefWidgetsState();
}

class _ChefWidgetsState extends State<ChefWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          ChefContainer(
            chefModel:
                ChefModel("assets/images/eren.jpg", "Eren Karaboğa", 600, 3),
          ),
          const SizedBox(
            height: 30,
          ),
          ChefContainer(
            chefModel:
                ChefModel("assets/images/dilara.jpg", "Dilara Özdemir", 400, 5),
          )
        ]),
      ),
    );
  }
}
