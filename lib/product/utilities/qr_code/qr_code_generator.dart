import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

qrGenarator(String docId) {
  return Get.defaultDialog(
      titlePadding: const EdgeInsets.all(10),
      title: "Aşçıya okutunuz",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black),
      middleTextStyle: const TextStyle(color: Colors.black),
      barrierDismissible: true,
      radius: 30,
      content: SizedBox(
        width: 200,
        height: 200,
        child: QrImage(
          data: docId,
          size: 200,
          backgroundColor: Colors.white,
        ),
      ));
}
