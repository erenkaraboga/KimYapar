import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/styles.dart';
import 'package:kimyapar/product/widgets/login/loginWidgets.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';

import '../../../core/base/text.dart';
import '../../../core/languages/tr.dart';
import '../../../product/utilities/validate/validate.dart';

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
  String password="";
  @override
  Widget build(BuildContext context) {
    
    var width2 = 325.0;
    var height2 = 680.0;
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
                  height: 40,
                ),
                Container(
                  width: width2,
                  height: height2,
                  decoration: ContainerStyles.backroundBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginWidgets.LottieLogin(),
                      LoginWidgets.HelloText(),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginWidgets.PleaseSignText(),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginWidgets.SwippableBtnUP(),
                      const SizedBox(
                        height: 20,
                      ),
                      MailField(),
                      const SizedBox(
                        height: 12,
                      ),
                      PassField(),
                      const SizedBox(
                        height: 12,
                      ),
                      RPassField(),
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
          loginController.register(
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
                text: Tr.signUp, style: TextStyles.loginButtonStyle)),
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
        onChanged: (val) => password = val,  
        validator: Validate.passwordValidator,
        decoration: TextFieldStyles.PassField,
      ),
    );
  }
  RPassField() {
    return SizedBox(
      width: 260,
      height: 60,
      child: TextFormField(
        obscureText: true,
        controller: RpassController,
        validator: (pass) => MatchValidator(errorText: 'Şifreler Eşleşmiyor').validateMatch(pass!, password),
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
