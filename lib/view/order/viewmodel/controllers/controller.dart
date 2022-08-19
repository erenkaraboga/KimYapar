import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/order/service/IOrderService.dart';

class OrderController extends GetxController {
  final IFirebaseService service;
  final IOrderService orderService;
  var chefModel = UserModel().obs;
  OrderController(this.service, this.orderService);

  Stream<QuerySnapshot<Map<String, dynamic>>> getMyOrders() {
    return orderService.getMyOrders();
  }

  void addOrder(String desc) {
    orderService.addOrder(desc);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrderedUser(String id) {
    return orderService.getOrderedUser(id);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUser() {
    return service.db.collection('users').snapshots();
  }
}
