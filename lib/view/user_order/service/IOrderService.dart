import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

import '../../../services/firebase/FirebaseService.dart';

abstract class IOrderService {
  final FirebaseService service;
  IOrderService(this.service);
  void addOrder(String desc);
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotTakenOrders(); 
  Stream<QuerySnapshot<Map<String, dynamic>>> getMyOrders();
  Stream<QuerySnapshot<Map<String, dynamic>>> getCurrentOrderedUser(String id);
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentOrder(String docId);
  void takeOrder(String docId);
  
}
