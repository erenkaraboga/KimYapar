import 'package:get/get.dart';
import 'package:kimyapar/core/constants/styles/text.dart';
import 'package:kimyapar/view/user_order/model/ordermodel.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../view/user_order/viewmodel/controllers/controller.dart';

final orderController = Get.find<OrderController>();
cancelButtonOrder(OrderModel orderModel, String docId) {
  return orderModel.status == 0
      ? ElevatedButton(
          onPressed: () {
            orderController.docId.value = docId;
            _dialog(orderModel);
          },
          style: ElevatedButton.styleFrom(primary: Colors.red.shade400),
          child: const Text("İptal et"),
        )
      : ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
          child: const Text("İptal et"),
        );
}

_dialog(OrderModel model) {
  return Get.defaultDialog(
      titlePadding: const EdgeInsets.all(30),
      title: "Siparişi İptal Et",
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
      backgroundColor: Colors.white,
      titleStyle: dialogTitleStyle(),
      middleTextStyle: dialogmidTextStyle(),
      textConfirm: "İptal Et",
      textCancel: "Geri",
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      onConfirm: () {
        orderController.cancelOrder();
        Get.close(1);
      },
      onCancel: () {
        Get.close(1);
      },
      buttonColor: Colors.orange,
      barrierDismissible: false,
      radius: 10,
      content: Column(
        children: [
          LottieBuilder.asset("assets/lottie/cancel.json",
              frameRate: FrameRate.max),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Siparişi iptal etmek istiyor musunuz ?",
            style: dialogmidTextStyle(),
          ),
        ],
      ));
}
