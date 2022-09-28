import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../../../view/user_order/viewmodel/controllers/controller.dart';

complate() {
  final orderController = Get.find<OrderController>();
  return Positioned(
    bottom: 5,
    right: 30,
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: ChoiceChip(
        labelStyle: const TextStyle(color: Colors.white),
        label: const Text(
          "Teslim Ettim",
          style: TextStyle(color: Colors.white),
        ),
        selected: false,
        avatar: !orderController.isFinishButtonEneabled.value
            ? const Icon(
                Icons.touch_app_outlined,
                color: Colors.white,
              )
            : null,
        onSelected: orderController.isFinishButtonEneabled.value
            ? null
            : (bool selected) {
               // orderController.isFinishButtonEneabled.value = true;
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
      textConfirm: "Oku",
      textCancel: "Geri",
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.offNamed("/qr");
      },
      buttonColor: Colors.orange,
      barrierDismissible: false,
      radius: 30,
      content: Column(
        children: [
          LottieBuilder.asset("assets/lottie/qrOrder.json",
              frameRate: FrameRate.max),
          Container(child: const Text("Müşterinin Cihazındaki Qr Okuyun")),
        ],
      ));
}
