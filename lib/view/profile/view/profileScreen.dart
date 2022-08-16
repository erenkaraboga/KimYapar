import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';

import '../../../product/widgets/profile/appbar.dart';
import '../../../product/widgets/profile/buttonWidget.dart';
import '../../../product/widgets/profile/profileWidget.dart';
import '../../../product/widgets/profile/textField.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final loginControllerr = Get.find<LoginController>();

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: loginControllerr.model.value.imageUrl!,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(loginControllerr.model.value),
          TextFieldWidget(
            label: 'İsim Soyisim',
            text: loginControllerr.model.value.name!,
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: loginControllerr.model.value.email!,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          buildUpgradeButton()
        ],
      ),
    );
  }

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Güncelle',
        onClicked: () {},
      );
  Widget buildName(UserModel model) => Column(
        children: [
          Text(
            model.name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            model.email!,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );
}
