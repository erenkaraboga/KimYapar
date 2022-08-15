import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/order/service/IOrderService.dart';

class OrderController extends GetxController{
 final IFirebaseService service;
 final IOrderService orderService;

  OrderController(this.service, this.orderService);
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrders(){
    return service.db.collection('orders').snapshots();
  }
}