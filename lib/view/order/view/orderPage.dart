import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/styles/container.dart';
import 'package:kimyapar/view/order/model/OrderModel.dart';
import 'package:kimyapar/view/order/viewmodel/controllers/controller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/responsive.dart';
import '../../../core/constants/styles/text.dart';
import '../../map/model/UserModel.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

final orderController = Get.find<OrderController>();

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: orderController.getOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data!.docs.map((document) {
                var orderModel = OrderModel.fromDocumentSnapshot(
                    document as DocumentSnapshot<Map<String, dynamic>>);
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 13.0),
                    child: Container(
                      height: Responsive.isTablet(context) ? 130 : 100,
                      width: double.infinity,
                      decoration: foodOrderBox(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    userAvatar(
                                        context, "assets/images/eren.jpg"),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("20 TL",
                                            style: ksmallTextStyle(context)),
                                        Text(orderModel.desc!,
                                            style: foodNameTextStyle(context)),
                                        const SizedBox(height: 8),
                                        orderStatus(context, orderModel)
                                      ],
                                    ),
                                  ],
                                ),
                                chefAvatar(orderModel, context),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList());
            } else {
              return Container();
            }
          }),
    );
  }

  chefAvatar(OrderModel model, BuildContext context) {
    return model.receivedUser == ''
        ? userAvatar(context, "assets/images/chef.jpg")
        : userAvatar(context, "assets/images/dilara.jpg");
  }

  orderStatus(BuildContext context, OrderModel model) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50)),
      height: 27,
      width: Responsive.isTablet(context) ? 180 : 160,
      child: Padding(
          padding: const EdgeInsets.only(left: 4.0), child: checkStatus(model)),
    );
  }

  checkStatus(OrderModel model) {
    if (model.status == true && model.receivedUser != '') {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.verified,
            color: CupertinoColors.activeGreen,
          ),
          "Hazırlandı");
    } else if (model.status == false && model.receivedUser != '') {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.lock_clock,
            color: Colors.redAccent,
          ),
          "Hazırlanıyor ");
    } else {
      return orderStatusBuilder(
          context,
          const Icon(
            Icons.record_voice_over,
            color: Colors.blueGrey,
          ),
          "Şef Bekleniyor");
    }
  }

  orderStatusBuilder(BuildContext context, Icon icon, String text) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: ksmallTextStyle(context),
        )
      ],
    );
  }

  userAvatar(BuildContext context, String imagePath) {
    return Container(
      height: Responsive.isTablet(context) ? 90 : 70,
      width: Responsive.isTablet(context) ? 90 : 70,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
            height: Responsive.isTablet(context) ? 60 : 55,
            width: Responsive.isTablet(context) ? 65 : 55,
            child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  width: 128,
                  height: 128,
                ),
              ),
            )),
      ),
    );
  }
}
