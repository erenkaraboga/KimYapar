import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/styles/container.dart';

import 'package:kimyapar/product/widgets/login/loginWidgets.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';
import '../../../core/base/text.dart';
import '../../../core/constants/styles/text.dart';
import '../../../core/constants/styles/textfield.dart';
import '../../../core/languages/tr.dart';
import '../../../product/utilities/validate/validate.dart';
import '../../map/viewmodel/controllers/mapController.dart';

class SingIn extends StatefulWidget {
  @override
  State<SingIn> createState() => _SingInState();
}

final mapController = Get.find<MapController>();
final loginControllerr = Get.find<LoginController>();
final TextEditingController passController = TextEditingController();
final TextEditingController maiilController = TextEditingController();

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
    var width2 = context.width * 0.85;
    var height2 = context.height * 0.85;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: backround(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.1,
                ),
                Container(
                  width: width2,
                  height: height2,
                  decoration: backroundBox(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => loginControllerr.isLoading.value
                            ? LottieLogin()
                            : LottieLoginSuccess(),
                      ),
                      HelloText(),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      PleaseSignText(),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      SwippableBtnIN(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      mailField(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      passField(),
                      forgotPass(),
                      loginButton(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      SocialLoginBtn()
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

  loginButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          loginControllerr.login(
              maiilController.text.trim(), passController.text.trim());
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: context.width * 0.7,
        decoration: loginBox(),
        child:  Padding(
            padding: EdgeInsets.all(12.0),
            child: CreateText(
                text: Tr.signin, style: loginButtonStyle())),
      ),
    );
  }

  passField() {
    return SizedBox(
      width: context.width * 0.67,
      height: context.height * 0.10,
      child: TextFormField(
        obscureText: true,
        controller: passController,
        validator: Validate.passwordValidator,
        decoration: passFieldd(),
      ),
    );
  }

  mailField() {
    return SizedBox(
        width: context.width * 0.67,
        height: context.height * 0.10,
        child: TextFormField(
          controller: maiilController,
          validator: Validate.emailValidator,
          decoration: mailFieldd(),
        ));
  }
}
