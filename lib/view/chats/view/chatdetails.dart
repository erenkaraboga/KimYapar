import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/chats/viewmodel/controller/chatcontroller.dart';

import '../../../core/languages/tr.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail({Key? key}) : super(key: key);

  @override
  ChatDetailState createState() => ChatDetailState();
}

class ChatDetailState extends State<ChatDetail> {
  final chatController = Get.find<ChatController>();
  final _textController = TextEditingController();
  ChatDetailState();
  @override
  var currentUserId;

  @override
  void initState() {
    super.initState();
    currentUserId = chatController.service.auth.currentUser!.uid;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => StreamBuilder<QuerySnapshot>(
          stream: chatController.streamRequest(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(Tr.error),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              Future.delayed(const Duration(seconds: 2));
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return chatController.isLoading.value
                ? MessagePage(snapshot, context):const Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          },
        ));
  }

  MessagePage(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(chatController.friendName.value),
          trailing: deleteButton(),
          leading: Material(
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left_outlined,
              ),
              onPressed: () {
                Get.offNamed('order');
              },
            ),
          ),
        ),
        child: SafeArea(
            child:  Column(
                    children: [messages(snapshot, context), writeMessageBox()],
                  )
               ));
  }

  writeMessageBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: CupertinoTextField(
              controller: _textController,
            ),
          ),
        ),
        CupertinoButton(
            child: const Icon(Icons.send_sharp),
            onPressed: () => sendMessage(_textController.text))
      ],
    );
  }

  messages(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, BuildContext context) {
    return Expanded(
      child: ListView(
        reverse: true,
        children: snapshot.data!.docs.map(
          (DocumentSnapshot document) {
            var data = document.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChatBubble(
                clipper: ChatBubbleClipper6(
                  radius: 20,
                  type: isSender(data['uid'].toString())
                      ? BubbleType.sendBubble
                      : BubbleType.receiverBubble,
                ),
                alignment: getAlignment(data['uid'].toString()),
                margin: const EdgeInsets.only(top: 20),
                backGroundColor: isSender(data['uid'].toString())
                    ? Colors.orange
                    : const Color(0xffE7E7ED),
                child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 17,
                          color: isSender(data['uid'].toString())
                              ? Colors.white
                              : Colors.black),
                      child: Text(data['msg'],
                          maxLines: 200, overflow: TextOverflow.ellipsis),
                    )),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  deleteButton() {
    return Material(
      child: IconButton(
        icon: const Icon(
          Icons.delete_outline,
        ),
        color: Colors.amber,
        onPressed: () async {
          print("*****************");
          await chatController.deleteMessage();
        },
      ),
    );
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    chatController.service.db
        .collection('chats')
        .doc(chatController.chatDocId.value.toString())
        .collection('messages')
        .add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'friendName': chatController.friendName.value,
      'msg': msg
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }
}
