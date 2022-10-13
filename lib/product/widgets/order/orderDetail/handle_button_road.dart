import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/product/widgets/map/bottomshettPanel.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../../../view/user_order/model/ordermodel.dart';
import '../../../../view/user_order/viewmodel/controllers/controller.dart';

road(OrderModel model) {
  final orderController = Get.find<OrderController>();
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: ChoiceChip(
      labelStyle: const TextStyle(color: Colors.white),
      label: const Text(
        "Yola Çık",
        style: TextStyle(color: Colors.white),
      ),
      selected: false,
      avatar: model.status == 1
          ? const Icon(
              Icons.touch_app_outlined,
              color: Colors.white,
            )
          : null,
      onSelected: model.status == 1
          ? (bool selected) {
              _dialog(model);
            }
          : null,
      //Do whatever you want when the chip is selected
      selectedColor: CupertinoColors.activeGreen,
      disabledColor: AppColors.primary,
      backgroundColor: Colors.green,
      elevation: 15,
    ),
  );
}

_dialog(OrderModel model) {
  return Get.defaultDialog(
      titlePadding: const EdgeInsets.all(10),
      title: "Sipariş Alımı",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black),
      middleTextStyle: const TextStyle(color: Colors.black),
      textConfirm: "Evet",
      onConfirm: () {
        orderController.roadOrder();
        Get.close(1);
      },
      textCancel: "Geri",
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.orange,
      contentPadding: const EdgeInsets.all(20),
      barrierDismissible: false,
      radius: 30,
      content: Column(
        children: [
          LottieBuilder.asset("assets/lottie/roadOrder.json",
              frameRate: FrameRate.max),
          Container(child: const Text("Yola Çıkın")),
        ],
      ));
}
