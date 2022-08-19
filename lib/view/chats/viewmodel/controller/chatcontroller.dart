import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/IFirebaseService.dart';
import '../../../map/model/UserModel.dart';

class ChatController extends GetxController {
  final IFirebaseService service;
  ChatController(this.service);
  var list = Rx<List<UserModel>>([]);
  var chatDocId = "".obs;
  var friendUid = "".obs;
  var isLoading = true.obs;
  var friendName = "".obs;
  @override
  bindFriend(UserModel model) {
    friendUid.value = model.id!;
    friendName.value = model.name!;
    friendName.refresh();
    friendUid.refresh();
  }

  deleteMessage() async {
    changeLoading();
    await service.db
        .collection("chats")
        .doc(chatDocId.value)
        .collection("messages")
        .get()
        .then((value) {
      for (var data in value.docs) {
        service.db
            .collection("chats")
            .doc(chatDocId.value)
            .collection("messages")
            .doc(data.id)
            .delete()
            .then((value) {
          service.db.collection("chatRoom").doc(chatDocId.value).delete();
        });
      }
    });
    changeLoading();
  }

  sendMessage(UserModel model) async {
    bindFriend(model);
    await checkConnectUserStatus();
    Get.offNamed(
      "/chatDetail",
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamRequest() {
    return service.db
        .collection('chats')
        .doc(chatDocId.value.toString())
        .collection('messages')
        .orderBy('createdOn', descending: true)
        .snapshots();
  }

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  checkConnectUserStatus() async {
    await service.db
        .collection('chats')
        .where('users', isEqualTo: {
          friendUid.value: null,
          service.auth.currentUser!.uid: null
        })
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              chatDocId.value = querySnapshot.docs.single.id;

              chatDocId.refresh();
            } else {
              await service.db.collection('chats').add({
                'users': {
                  service.auth.currentUser!.uid: null,
                  friendUid.value: null
                },
                'names': {
                  service.auth.currentUser!.uid:
                      service.auth.currentUser!.displayName,
                  friendUid.value: friendName.value
                }
              }).then((value) => {
                    chatDocId.value = value.id,
                  });
            }
          },
        )
        .catchError((error) {
          print(error);
        });
  }
}
