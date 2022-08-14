import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/chats/view/chatdetails.dart';
import 'package:kimyapar/view/chats/viewmodel/controller/chatcontroller.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

final chatController = Get.find<ChatController>();

class _ChatsState extends State<Chats> {
  @override
  void initState() {
    
    super.initState();
  }
@override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    chatController.getChatUsers();
    return Scaffold(
        body: Obx(
      () => ListView.builder(
          itemCount: chatController.list.value.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                subtitle: const Text("Available"),
                trailing: const Text(
                  "ACTIVE",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                onTap: () async{
                  chatController.bindFriend(index);
                  await  chatController.checkUser();
                    Get.offNamed("/chatDetail", 
                  );
                  
                },
                title: Text(chatController.list.value[index].name!));
          }),
    ));
  }
}
