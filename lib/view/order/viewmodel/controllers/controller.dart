import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/order/service/IOrderService.dart';

class OrderController extends GetxController{
 final IFirebaseService service;
 final IOrderService orderService;
  var model = UserModel().obs;
  OrderController(this.service, this.orderService);
  Stream<QuerySnapshot<Map<String, dynamic>>> getOrders(){
    return orderService.getOrders();
  }
  void addOrder(String desc){
     orderService.addOrder(desc);
  }
  
}