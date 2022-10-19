import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../services/firebase/FirebaseService.dart';
import '../../add_order/model/add_order_model.dart';

abstract class IOrderService {
  final FirebaseService service;
  IOrderService(this.service);
  void addOrder(AddOrderModel model);
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotTakenOrders();
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotCompletedOrders();
  Stream<QuerySnapshot<Map<String, dynamic>>> getCompletedOrders();
  Stream<QuerySnapshot<Map<String, dynamic>>> getCompletedUserByChef();
  Stream<QuerySnapshot<Map<String, dynamic>>> getCurrentOrderedUser(String id);
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentOrder(String docId);
  void cancelOrder(String docId);
  void roadOrder(String docId);
  void qrStatus(String docId);
  void takeOrder(String docId);
  void completeOrder(String docId);
  finishOrder(String docId, String qr);
}
