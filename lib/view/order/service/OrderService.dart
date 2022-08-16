import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kimyapar/view/order/model/OrderModel.dart';
import 'package:kimyapar/view/order/service/IOrderService.dart';

class OrderService extends IOrderService{
  OrderService(super.service);
  @override
  void addOrder() {
    
  }

  @override
  void deleteOrder() {
   
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrders() {
   return super.service.db.collection("orders").snapshots();
  }

}