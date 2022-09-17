import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

import '../../service/IOrderService.dart';

class OrderController extends GetxController {
  final IFirebaseService service;
  final IOrderService orderService;
  var chefModel = UserModel().obs;
  OrderController(this.service, this.orderService);
    
    void onReady() {
    listenState();
    super.onReady();

  }
   getMyOrders() {
    return orderService.getMyOrders();
  }
   
   addOrder(String desc) {
    orderService.addOrder(desc);
  }
   getNotTakenOrders(){
     return orderService.getNotTakenOrders(); 
  }

  getCurrentOrderedUser(String id) {
    return orderService.getCurrentOrderedUser(id);
  }

   getUser() {
    return service.db.collection('users').snapshots();
  }
   takeOrder(String docId){
    orderService.takeOrder(docId);
   }
   listenState(){
    orderService.listenState();
   }
 
}
