import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/controller/chatcontroller.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({Key? key, required this.friendName, required this.friendId})
      : super(key: key);
  final friendName;
  final friendId;
  var chatdocId;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

final chatController = Get.find<ChatController>();

class _ChatDetailState extends State<ChatDetail> {
  @override
  void initState()  {
    checkUser();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void checkUser() async {
    await chatController.service.db
        .collection('chats')
        .where('users', isEqualTo: {
          widget.friendId: null,
          chatController.service.auth.currentUser!.uid: null
        })
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                widget.chatdocId = querySnapshot.docs.single.id;
              });
            } else {
              await chatController.service.db.collection('chats').add({
                'users': {
                  chatController.service.auth.currentUser!.uid: null,
                  widget.friendId: null
                },
              }).then((value) => {widget.chatdocId = value});
            }
          },
        )
        .catchError((error) {});
    super.initState();
  }
}
