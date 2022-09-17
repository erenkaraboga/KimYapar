import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'IOrderService.dart';

class OrderService extends IOrderService {
  OrderService(super.service);

  CollectionReference<Map<String, dynamic>> getOrderRequest() {
    return super.service.db.collection("orders");
  }

  @override
  void addOrder(String desc) {
    getOrderRequest().add({
      'createdOn': FieldValue.serverTimestamp(),
      'createdUser': super.service.auth.currentUser!.uid,
      'desc': desc,
      'receivedUser': "",
      'status': false
    });
  }

  @override
  getMyOrders() {
    var response = getOrderRequest()
        .where('createdUser', isEqualTo: super.service.auth.currentUser!.uid)
        .snapshots();
    inspect(response);
    return response;
  }

  @override
  getCurrentOrderedUser(String id) {
    return service.db
        .collection('users')
        .where('id', isEqualTo: id)
        .snapshots();
  }

  @override
  getNotTakenOrders() {
    return getOrderRequest()
        .where("createdUser", isNotEqualTo: super.service.auth.currentUser!.uid)
        .where("receivedUser",
            whereIn: ["", super.service.auth.currentUser!.uid]).snapshots();
  }

  @override
  takeOrder(String docId) {
    getOrderRequest()
        .doc(docId)
        .update({'receivedUser': super.service.auth.currentUser!.uid});
  }

  @override
  void listenState() {
    getOrderRequest()
        .where("createdUser", isNotEqualTo: super.service.auth.currentUser!.uid)
        .where("receivedUser",
            whereIn: ["", super.service.auth.currentUser!.uid]).snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            print("New : ${change.doc.data()}");
            break;
          case DocumentChangeType.modified:
            print("Modified : ${change.doc.data()}");
            break;
          case DocumentChangeType.removed:
            print("Removed : ${change.doc.data()}");
            break;
        }
      }
    });
  }
}
