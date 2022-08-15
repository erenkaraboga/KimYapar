import 'package:get/get.dart';
import 'package:kimyapar/product/init/network/firebase_auth.dart';
import 'package:kimyapar/view/order/service/OrderService.dart';
import 'package:kimyapar/view/order/viewmodel/controllers/controller.dart';

import '../../../../product/init/network/firebase_init.dart';
import '../../../../services/firebase/FirebaseService.dart';


class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderController>(OrderController(
        FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
        OrderService(FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db))));
  }
}
