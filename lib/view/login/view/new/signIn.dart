import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/styles/container.dart';

import 'package:kimyapar/product/widgets/login/loginWidgets.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../core/base/text.dart';
import '../../../../core/constants/styles/text.dart';
import '../../../../core/constants/styles/textfield.dart';
import '../../../../core/languages/tr.dart';
import '../../../../product/utilities/validate/validate.dart';
import '../../../map/viewmodel/controllers/mapController.dart';

class SignInNEW extends StatefulWidget {
  @override
  State<SignInNEW> createState() => _SignInNEWState();
}

final mapController = Get.find<MapController>();
final loginControllerr = Get.find<LoginController>();
final TextEditingController passController = TextEditingController();
final TextEditingController maiilController = TextEditingController();
var maskFormatter = MaskTextInputFormatter(
    mask: '+90 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager);

class _SignInNEWState extends State<SignInNEW> {
  void click() {}
  @override
  void initState() {
    //mapController.getLocation();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width2 = context.width * 0.80;
    var height2 = context.height * 0.65;
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
                  height: context.height * 0.15,
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
                        height: context.height * 0.04,
                      ),
                      mailField(),
                      SizedBox(
                        height: context.height * 0.04,
                      ),
                      loginButton(),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
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
          print(maiilController.text);
          print(maskFormatter.getUnmaskedText());
          print("+90${maskFormatter.getUnmaskedText()}");
          loginControllerr.verify("+90${maskFormatter.getUnmaskedText()}");
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: context.width * 0.7,
        decoration: loginBox(),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CreateText(text: Tr.signin, style: loginButtonStyle())),
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
            inputFormatters: [maskFormatter],
            controller: maiilController,
            validator: Validate.phone,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                suffix: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset("assets/images/turkey.png")),
                labelText: "Telefon",
                hintText: "(+90 123-456-789)",
                hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ))));
  }
}
