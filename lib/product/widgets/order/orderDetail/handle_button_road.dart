import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../../../view/user_order/viewmodel/controllers/controller.dart';

road() {
  final orderController = Get.find<OrderController>();
  return Positioned(
    bottom: 50,
    right: 110,
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: ChoiceChip(
        labelStyle: const TextStyle(color: Colors.white),
        label: const Text(
          "Yoldayım",
          style: TextStyle(color: Colors.white),
        ),
        selected: false,
        avatar: !orderController.isRoadButtonEneabled.value
            ? const Icon(
                Icons.touch_app_outlined,
                color: Colors.white,
              )
            : null,
        onSelected: orderController.isRoadButtonEneabled.value
            ? null
            : (bool selected) {
                orderController.isRoadButtonEneabled.value = true;
                orderController.isFinishButtonEneabled.value = false;
                _dialog();
              },
        //Do whatever you want when the chip is selected
        selectedColor: CupertinoColors.activeGreen,
        disabledColor: AppColors.primary,
        backgroundColor: Colors.green,
        elevation: 15,
      ),
    ),
  );
}

_dialog() {
  return Get.defaultDialog(
      titlePadding: const EdgeInsets.all(10),
      title: "Sipariş Alımı",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black),
      middleTextStyle: const TextStyle(color: Colors.black),
      textConfirm: "Evet",
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
