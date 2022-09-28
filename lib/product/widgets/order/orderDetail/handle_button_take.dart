import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:kimyapar/product/widgets/map/bottomshettPanel.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../../../view/user_order/viewmodel/controllers/controller.dart';

take() {
  final orderController = Get.find<OrderController>();
  return Positioned(
    left: 20,
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      child: ChoiceChip(
        labelStyle: const TextStyle(color: Colors.white),
        label: const Text(
          "Ben Yaparım",
          style: TextStyle(color: Colors.white),
        ),
        selected: false,
        avatar: !orderController.isOrderButtonEneabled.value
            ? const Icon(
                Icons.touch_app_outlined,
                color: Colors.white,
              )
            : null,
        onSelected: orderController.isOrderButtonEneabled.value
            ? null
            : (bool selected) {
                orderController.isOrderButtonEneabled.value = true;
                orderController.isPrepareButtonEneabled.value = false;
                _dailog();
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

_dailog() {
  Get.defaultDialog(
      titlePadding: const EdgeInsets.all(30),
      title: "Sipariş Alımı",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black),
      middleTextStyle: const TextStyle(color: Colors.black),
      textConfirm: "Evet",
      textCancel: "Geri",
      onConfirm: (){
        orderController.takeOrder();
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.orange,
      barrierDismissible: false,
      radius: 30,
      content: Column(
        children: [
          LottieBuilder.asset("assets/lottie/takeOrder.json",
              frameRate: FrameRate.max),
          Container(
              child: const Text("Siparişi Almak İstediğinize Emin Misiniz ?")),
        ],
      ));
}
