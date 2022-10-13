import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/product/widgets/map/bottomshettPanel.dart';
import 'package:kimyapar/view/user_order/model/ordermodel.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../../../view/user_order/viewmodel/controllers/controller.dart';

complate(OrderModel model) {
  final orderController = Get.find<OrderController>();
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: ChoiceChip(
      labelStyle: const TextStyle(color: Colors.white),
      label: const Text(
        "Qr Okut",
        style: TextStyle(color: Colors.white),
      ),
      selected: false,
      avatar: model.status == 2
          ? const Icon(
              Icons.touch_app_outlined,
              color: Colors.white,
            )
          : null,
      onSelected: model.status! >=2
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
      title: "Qr Okut",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black),
      middleTextStyle: const TextStyle(color: Colors.black),
      textConfirm: "Oku",
      textCancel: "Geri",
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      onConfirm: () {
        orderController.qrStatus();
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
