import 'package:get/get.dart';
import 'package:kimyapar/product/init/network/firebase_auth.dart';
import 'package:kimyapar/product/init/network/firebase_messaging.dart';

import 'package:kimyapar/view/user_order/viewmodel/controllers/controller.dart';

import '../../../../product/init/network/firebase_init.dart';
import '../../../../services/firebase/FirebaseService.dart';
import '../../../chats/viewmodel/controller/chatcontroller.dart';
import '../../service/OrderService.dart';



class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderController>(OrderController(
        FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
        OrderService(FirebaseService(
            FirebaseAuthInit.instance.auth, FirebaseInit.instance.db))));
            Get.put<ChatController>(ChatController(
      FirebaseService(FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
    ),permanent: true);
  }
}