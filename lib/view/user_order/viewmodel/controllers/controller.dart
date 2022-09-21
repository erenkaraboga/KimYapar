import 'package:get/get.dart';
import 'package:kimyapar/services/firebase/IFirebaseService.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/user_order/model/ordermodel.dart';

import '../../service/IOrderService.dart';

class OrderController extends GetxController {
  final IFirebaseService service;
  final IOrderService orderService;
  var orderModel = OrderModel().obs;
  var orderedModel = UserModel().obs;
  var docId = "".obs;
  var isOrderButtonEneabled = false.obs;
  var isPrepareButtonEneabled = true.obs;
  var isRoadButtonEneabled = true.obs;
  var isFinishButtonEneabled = true.obs;
  bindOrder(OrderModel orderModel, UserModel orderedModel) {
    this.orderModel.value = orderModel;
    this.orderedModel.value = orderedModel;
  }

  OrderController(this.service, this.orderService);

  getMyOrders() {
    return orderService.getMyOrders();
  }

  addOrder(String desc) {
    orderService.addOrder(desc);
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

  takeOrder(String docId) {
    orderService.takeOrder(docId);
  }

  getCurrentOrder() {
    return orderService.getCurrentOrder(docId.value);
  }
}
