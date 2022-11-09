import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/styles/container.dart';
import 'package:kimyapar/product/extension/date.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/map/viewmodel/controllers/mapController.dart';

import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/styles/text.dart';
import '../../../../core/languages/tr.dart';
import '../../../../product/widgets/order/appbar.dart';
import '../../../../product/widgets/order/message.dart';
import '../../../../product/widgets/order/orderStatus.dart';
import '../../../../product/widgets/order/userAvatar.dart';
import '../../../chats/viewmodel/controller/chatcontroller.dart';
import '../../model/ordermodel.dart';
import '../../viewmodel/controllers/controller.dart';

class ChefOrder extends StatefulWidget {
  const ChefOrder({Key? key}) : super(key: key);

  @override
  State<ChefOrder> createState() => _ChefOrderState();
}

final orderController = Get.find<OrderController>();
final loginController = Get.find<LoginController>();
final chatController = Get.find<ChatController>();
final mapController = Get.find<MapController>();

class _ChefOrderState extends State<ChefOrder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loginController.getCurrentUser();
    return Scaffold(
      appBar: appBarWithPath("Gelen Siparişler", '/completeOrderChef'),
      body: StreamBuilder<QuerySnapshot>(
        stream: orderController.getNotTakenOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.transparent,
              ),
            );
          }
          if (snapshot.hasData) {
            return ordersWithUsers(snapshot);
          } else {
            return const Center(
              child: Text(Tr.error),
            );
          }
        },
      ),
    );
  }

  ordersWithUsers(snapshot) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          var docId = snapshot.data!.docs[index].reference.id;
          //orderController.docId.value=docId;
          var orderModel = OrderModel.fromDocumentSnapshot(snapshot
              .data!.docs[index] as DocumentSnapshot<Map<String, dynamic>>);
          return StreamBuilder<QuerySnapshot>(
            stream:
                orderController.getCurrentOrderedUser(orderModel.createdUser!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.transparent,
                  ),
                );
              }
              var orderedModel = UserModel.fromDocumentSnapshot(snapshot
                  .data!.docs[0] as DocumentSnapshot<Map<String, dynamic>>);
              orderController.bindOrder(orderModel, orderedModel);
              return orders(context, orderModel, orderedModel, docId);
            },
          );
        });
  }

  calculate(UserModel orderedModel) async {
   /* var position = mapController.position.value;
    var distance = mapController.drawDistance(orderedModel.lat!,
        orderedModel.long!, position.latitude, position.longitude);*/
    //print(distance);
  }

  orders(BuildContext context, OrderModel orderModel, UserModel ordered,
      String docId) {
    calculate(ordered);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Container(
          height: Responsive.isTablet(context) ? 130 : 110,
          width: double.infinity,
          decoration: foodOrderBox(),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    orderDetail(context, orderModel, ordered),
                    const Spacer(),
                    chefDetail(orderModel, context, ordered, docId)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  chefDetail(OrderModel orderModel, BuildContext context, UserModel ordered,
      String docId) {
    return GestureDetector(
      onTap: () {
        orderController.docId.value = docId;
        Get.toNamed("/orderDetail", arguments: docId);
      },
      child: const Icon(
        Icons.chevron_right,
        size: 30,
      ),
    );
  }

  orderDetail(BuildContext context, OrderModel orderModel, UserModel ordered) {
    return Row(
      children: [
        Column(
          children: [
            userAvatar(context, ordered.imageUrl!),
            messageBoxChef(orderModel, ordered)
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("20 TL", style: ksmallTextStyle()),
            Text(orderModel.title!, style: foodNameTextStyle(context)),
            const SizedBox(height: 6),
            orderStatus(context, orderModel),
            const SizedBox(height: 5),
            orderModel.createdOn == null
                ? Text(
                    //extension
                    "date",
                    style: ksmallTextStyle(),
                  )
                : Text(
                    //extension
                    orderModel.createdOn!.toDatee(orderModel),
                    style: ksmallTextStyle(),
                  )
          ],
        ),
      ],
    );
  }
}
