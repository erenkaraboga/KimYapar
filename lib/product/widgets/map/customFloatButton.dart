import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/map/viewmodel/controllers/mapController.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../../../core/constants/colors.dart';
import '../../../view/login/viewmodel/controllers/loginController.dart';

class CustomFloatButton extends StatefulWidget {
  const CustomFloatButton({Key? key}) : super(key: key);

  @override
  State<CustomFloatButton> createState() => _CustomFloatButtonState();
}

final mapController = Get.find<MapController>();
final loginController = Get.find<LoginController>();

class _CustomFloatButtonState extends State<CustomFloatButton> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: const Icon(Icons.location_on),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          label: 'Konumum',
          onPressed: () {
            mapController.fetchFilteredUser();
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.logout),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          label: 'Çıkış Yap!',
          onPressed: () {
            loginController.signOut();
          },
        ),
      ],
      closedForegroundColor: Colors.black,
      openForegroundColor: Colors.white,
      closedBackgroundColor: Colors.white,
      openBackgroundColor: AppColors.primary,
      child: const Icon(Icons.add),
    );
  }
}
