import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../services/firebase/FirebaseService.dart';

abstract class IOrderService {
  final FirebaseService service;
  IOrderService(this.service);
  void addOrder(String desc);
  Stream<QuerySnapshot<Map<String, dynamic>>> getMyOrders();
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrderedUser(String id);

}
