import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import 'package:kimyapar/product/widgets/login/loginWidgets.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';

import '../../../core/base/text.dart';
import '../../../core/constants/styles/container.dart';
import '../../../core/constants/styles/text.dart';
import '../../../core/constants/styles/textfield.dart';
import '../../../core/languages/tr.dart';
import '../../../product/utilities/validate/validate.dart';
import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController maiilController = TextEditingController();
  final TextEditingController RpassController = TextEditingController();
  final loginController = Get.find<LoginController>();
  String password = "";
  @override
  void initState() {
     mapController.getLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width2 = context.width * 0.85;
    var height2 = context.height * 0.95;

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
                  height: context.height * 0.03,
                ),
                Container(
                  width: width2,
                  height: height2,
                  decoration: backroundBox(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LottieLogin(),
                      HelloText(),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      PleaseSignText(),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      SwippableBtnUP(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      mailField(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      passField(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      rpassField(),
                      forgotPass(),
                      LoginButton(),
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

  LoginButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          loginController.register(
              maiilController.text.trim(), passController.text.trim());
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: context.width * 0.7,
        decoration: loginBox(),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CreateText(text: Tr.signUp, style: loginButtonStyle())),
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
        onChanged: (val) => password = val,
        validator: Validate.passwordValidator,
        decoration: passFieldd(),
      ),
    );
  }

  rpassField() {
    return SizedBox(
      width: context.width * 0.67,
      height: context.height * 0.10,
      child: TextFormField(
        obscureText: true,
        controller: RpassController,
        validator: (pass) => MatchValidator(errorText: 'Şifreler Eşleşmiyor')
            .validateMatch(pass!, password),
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
