import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/map/viewmodel/controllers/mapController.dart';
import 'package:kimyapar/view/order/viewmodel/controllers/controller.dart';

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
              Future.delayed(const Duration(seconds: 2));
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return ListView(
                children:snapshot.data!.docs.map(
                  (DocumentSnapshot document){
                    var data = document.data() as Map<String, dynamic>;
                     return ListTile(title: Text(data['desc']),);
                }).toList()
              );
            } else {
              return Container();
            }
          }),
    );
  }
}

