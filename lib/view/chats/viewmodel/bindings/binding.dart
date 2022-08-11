import 'package:get/get.dart';
import 'package:kimyapar/view/chats/viewmodel/controller/chatcontroller.dart';

import '../../../../product/init/network/firebase_auth.dart';
import '../../../../product/init/network/firebase_init.dart';
import '../../../../services/firebase/FirebaseService.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChatController>(ChatController(
      FirebaseService(FirebaseAuthInit.instance.auth, FirebaseInit.instance.db),
    ));
  }
}
