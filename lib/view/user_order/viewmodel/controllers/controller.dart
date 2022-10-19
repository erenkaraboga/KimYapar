import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/user_order/model/ordermodel.dart';

import '../../../add_order/model/add_order_model.dart';
import '../../service/IOrderService.dart';

class OrderController extends GetxController {
  final IFirebaseService service;
  final IOrderService orderService;
  var orderModel = OrderModel().obs;
  var orderedModel = UserModel().obs;
  var docId = "".obs;
  var qr = "".obs;
  var success = false.obs;

  bindOrder(OrderModel orderModel, UserModel orderedModel) {
    this.orderModel.value = orderModel;
    this.orderedModel.value = orderedModel;
  }

  OrderController(this.service, this.orderService);

  getNotCompletedOrders() {
    return orderService.getNotCompletedOrders();
  }

  addOrder(AddOrderModel model) {
    orderService.addOrder(model);
  }
  getCompletedOrders(){
   return orderService.getCompletedOrders();
  }
  getCompletedOrdersByChef(){
    return orderService.getCompletedUserByChef();
  }

  getNotTakenOrders() {
    return orderService.getNotTakenOrders();
  }

  getCurrentOrderedUser(String id) {
    return orderService.getCurrentOrderedUser(id);
  }

  getUser() {
    return service.db.collection('users').snapshots();
  }

  roadOrder() {
    orderService.roadOrder(docId.value);
  }

  takeOrder() {
    orderService.takeOrder(docId.value);
  }

  getCurrentOrder(String docId) {
    return orderService.getCurrentOrder(docId);
  }

  finishOrder() {
    if (orderService.finishOrder(docId.value, qr.value)) {
      Get.toNamed("/successPage");
    } else {
      Get.toNamed("/errorPage");
    }
  }

  qrStatus() {
    orderService.qrStatus(docId.value);
  }
}
