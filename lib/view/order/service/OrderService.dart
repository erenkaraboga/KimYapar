import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/view/order/model/OrderModel.dart';
import 'package:kimyapar/view/order/service/IOrderService.dart';

class OrderService extends IOrderService{
  OrderService(super.service);
  @override
  void addOrder(String desc) {
    service.db
        .collection('orders')
        .add({
      'createdOn': FieldValue.serverTimestamp(),
      'createdUser': super.service.auth.currentUser!.uid,
      'desc': desc,
      'receivedUser': ""
    });
  }

  @override
  void deleteOrder() {
   
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrders() {
   var response = super.service.db.collection("orders").where('createdUser',isEqualTo: super.service.auth.currentUser!.uid).snapshots();
   inspect(response);
   return response;
  }

}