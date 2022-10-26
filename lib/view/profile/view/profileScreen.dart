import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/product/widgets/order/userAvatar.dart';

import '../../login/viewmodel/controllers/loginController.dart';
import '../../map/model/UserModel.dart';

class MyAccount extends StatelessWidget {
  final loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    var user = loginController.model.value;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 90),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            UserCard(
              user: user,
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
                elevation: 4,
                child: Column(
                  children: <Widget>[
                    const UserProfileActions(
                      text: "İletişim",
                      icon: Icon(Icons.mail_outline, color: Color(0xFFF9893E)),
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/credit");
                      },
                      child: const UserProfileActions(
                          text: "Ödeme Seçenekleri",
                          icon: Icon(Icons.payment, color: Color(0xFFF9893E))),
                    ),
                    const Divider(),
                    const UserProfileActions(
                        text: "Yardım",
                        icon:
                            Icon(Icons.help_outline, color: Color(0xFFF9893E))),
                    const Divider(),
                    const UserProfileActions(
                        text: "Hakkında",
                        icon:
                            Icon(Icons.info_outline, color: Color(0xFFF9893E))),
                    const Divider(),
                    const UserProfileActions(
                        text: "Çıkış Yap",
                        icon: Icon(Icons.logout, color: Color(0xFFF9893E))),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: userAvatar(context, user.imageUrl!),
          title: Text(user.name!,
              style: const TextStyle(
                  color: Color(0XFF174757),
                  fontSize: 20,
                  fontWeight: FontWeight.w800)),
          subtitle: Text(user.email!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              )),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class UserProfileActions extends StatelessWidget {
  final Icon icon;
  final String text;
  const UserProfileActions({Key? key, required this.icon, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon ?? const Icon(Icons.error),
      title: Text(text),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: Colors.grey,
      ),
    );
  }
}
