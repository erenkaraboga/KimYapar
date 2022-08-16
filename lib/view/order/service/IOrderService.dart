import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../services/firebase/FirebaseService.dart';

abstract class IOrderService{
   final FirebaseService service;
   IOrderService(this.service);
  void addOrder(String desc);
  void deleteOrder();
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrders();
}