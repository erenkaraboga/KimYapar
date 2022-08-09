import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/styles.dart';
import 'package:kimyapar/product/widgets/login/loginWidgets.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';

import '../../../core/base/text.dart';
import '../../../core/languages/tr.dart';
import '../../../product/utilities/validate/validate.dart';
import '../../map/viewmodel/controllers/mapController.dart';

class SingIn extends StatefulWidget {
  @override
  State<SingIn> createState() => _SingInState();
}

final mapController = Get.find<MapController>();
final loginControllerr = Get.find<LoginController>();
final TextEditingController passController = TextEditingController(text:"123456789");
final TextEditingController maiilController = TextEditingController(text: "eren@gmail.com");

class _SingInState extends State<SingIn> {
  void click() {}
  @override
  void initState() {
    mapController.getLocation();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width2 = 325.0;
    var height2 = 620.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: ContainerStyles.backround,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Container(
                  width: width2,
                  height: height2,
                  decoration: ContainerStyles.backroundBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => loginControllerr.isLoading.value
                            ? LoginWidgets.LottieLogin()
                            : LoginWidgets.LottieLoginSuccess(),

                      ),
                      LoginWidgets.HelloText(),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginWidgets.PleaseSignText(),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginWidgets.SwippableBtnIN(),
                      const SizedBox(
                        height: 20,
                      ),
                      MailField(),
                      const SizedBox(
                        height: 12,
                      ),
                      PassField(),
                      LoginWidgets.ForgotPass(),
                      LoginButton(),
                      const SizedBox(
                        height: 17,
                      ),
                      LoginWidgets.SocialLoginBtn()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  LoginButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          loginControllerr.login(
              maiilController.text.trim(), passController.text.trim());
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 250,
        decoration: ContainerStyles.LoginBox,
        child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CreateText(
                text: Tr.signin, style: TextStyles.loginButtonStyle)),
      ),
    );
  }

  PassField() {
    return SizedBox(
      width: 260,
      height: 60,
      child: TextFormField(
        obscureText: true,
        controller: passController,
        validator: Validate.passwordValidator,
        decoration: TextFieldStyles.PassField,
      ),
    );
  }

  MailField() {
    return SizedBox(
        width: 260,
        height: 60,
        child: TextFormField(
          controller: maiilController,
          validator: Validate.emailValidator,
          decoration: TextFieldStyles.MailField,
        ));
  }
}
