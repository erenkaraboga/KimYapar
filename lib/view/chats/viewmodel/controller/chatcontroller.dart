import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../services/firebase/IFirebaseService.dart';
import '../../../map/model/UserModel.dart';

class ChatController extends GetxController {
  final IFirebaseService service;
  ChatController(this.service);
   var list= Rx<List<UserModel>>([]);
   var chatDocId="".obs;
 @override
  void onReady() async{
    super.onReady();
    getChatUsers();
  }
  
   getChatUsers() async { 
    var response = await service.getOtherUsers();
    list.value = response;
  }
 void checkUser(String friendUid,String currentUserId) async {
    await service.db.collection('chats')
        .where('users', isEqualTo: {friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
                chatDocId.value = querySnapshot.docs.single.id;
            } else {
              await service.db.collection('chats').add({
                'users': {currentUserId: null, friendUid: null},

              }).then((value) => {
                chatDocId.value = value as String
              
              });
            }
          },
        )
        .catchError((error) {});
  }


}
