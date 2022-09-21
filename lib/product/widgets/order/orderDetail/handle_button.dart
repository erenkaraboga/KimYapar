import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../../../view/user_order/viewmodel/controllers/controller.dart';

class IHandleButton extends StatelessWidget {
  IHandleButton({
    Key? key,
  }) : super(key: key);

  final orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Obx(() => Stack(
            children: [
              const Divider(
                thickness: 1,
              ),
              Positioned(
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
                            orderController.isPrepareButtonEneabled.value =
                                false;
                            Get.defaultDialog(
                                titlePadding: const EdgeInsets.all(30),
                                title: "Sipariş Alımı",
                                backgroundColor: Colors.white,
                                titleStyle:
                                    const TextStyle(color: Colors.black),
                                middleTextStyle:
                                    const TextStyle(color: Colors.black),
                                textConfirm: "Evet",
                                textCancel: "Geri",
                                cancelTextColor: Colors.black,
                                confirmTextColor: Colors.white,
                                buttonColor: Colors.orange,
                                barrierDismissible: false,
                                radius: 30,
                                content: Column(
                                  children: [
                                    LottieBuilder.asset(
                                        "assets/lottie/takeOrder.json"),
                                    Container(
                                        child: const Text(
                                            "Siparişi Almak İstediğinize Emin Misiniz ?")),
                                  ],
                                ));
                          },
                    //Do whatever you want when the chip is selected
                    selectedColor: CupertinoColors.activeGreen,
                    disabledColor: AppColors.primary,
                    backgroundColor: Colors.green,
                    elevation: 15,
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 40,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ChoiceChip(
                    labelStyle: const TextStyle(color: Colors.white),
                    label: const Text(
                      "Hazırlıyorum",
                      style: TextStyle(color: Colors.white),
                    ),
                    selected: false,
                    avatar: !orderController.isPrepareButtonEneabled.value
                        ? const Icon(
                          Icons.touch_app_outlined,
                            color: Colors.white,
                          )
                        : null,
                    onSelected: orderController.isPrepareButtonEneabled.value
                        ? null
                        : (bool selected) {
                             orderController.isPrepareButtonEneabled.value =
                              true;
                            orderController.isRoadButtonEneabled.value = false;
                            Get.defaultDialog(
                                titlePadding: const EdgeInsets.all(10),
                                title: "Sipariş Alımı",
                                backgroundColor: Colors.white,
                                titleStyle:
                                    const TextStyle(color: Colors.black),
                                middleTextStyle:
                                    const TextStyle(color: Colors.black),
                                textConfirm: "Başla",
                                textCancel: "Geri",
                                cancelTextColor: Colors.black,
                                confirmTextColor: Colors.white,
                                buttonColor: Colors.orange,
                                barrierDismissible: false,
                                radius: 30,
                                content: Column(
                                  children: [
                                    LottieBuilder.asset(
                                        "assets/lottie/cookOrder.json"),
                                    Container(
                                        child:
                                            const Text("Hazırlamaya Başlayın")),
                                  ],
                                ));
                          },
                    //Do whatever you want when the chip is selected
                    selectedColor: CupertinoColors.activeGreen,
                    disabledColor: AppColors.primary,
                    backgroundColor: Colors.green,
                    elevation: 15,
                  ),
                ),
              ),
              Positioned(
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
                            orderController.isFinishButtonEneabled.value =
                                false;
                            Get.defaultDialog(
                                titlePadding: const EdgeInsets.all(10),
                                title: "Sipariş Alımı",
                                backgroundColor: Colors.white,
                                titleStyle:
                                    const TextStyle(color: Colors.black),
                                middleTextStyle:
                                    const TextStyle(color: Colors.black),
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
                                    LottieBuilder.asset(
                                        "assets/lottie/roadOrder.json"),
                                    Container(child: const Text("Yola Çıkın")),
                                  ],
                                ));
                          },
                    //Do whatever you want when the chip is selected
                    selectedColor: CupertinoColors.activeGreen,
                    disabledColor: AppColors.primary,
                    backgroundColor: Colors.green,
                    elevation: 15,
                  ),
                ),
              ),
              Positioned(
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
                            orderController.isFinishButtonEneabled.value = true;
                            Get.defaultDialog(
                                titlePadding: const EdgeInsets.all(10),
                                title: "Sipariş Alımı",
                                backgroundColor: Colors.white,
                                titleStyle:
                                    const TextStyle(color: Colors.black),
                                middleTextStyle:
                                    const TextStyle(color: Colors.black),
                                textConfirm: "Oku",
                                textCancel: "Geri",
                                cancelTextColor: Colors.black,
                                confirmTextColor: Colors.white,
                                buttonColor: Colors.orange,
                                barrierDismissible: false,
                                radius: 30,
                                content: Column(
                                  children: [
                                    LottieBuilder.asset(
                                        "assets/lottie/qrOrder.json"),
                                    Container(
                                        child: const Text(
                                            "Müşterinin Cihazındaki Qr Okuyun")),
                                  ],
                                ));
                          },
                    //Do whatever you want when the chip is selected

                    selectedColor: CupertinoColors.activeGreen,
                    disabledColor: AppColors.primary,
                    backgroundColor: Colors.green,
                    elevation: 15,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
