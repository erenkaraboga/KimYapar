import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:kimyapar/core/base/text.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/core/constants/styles.dart';
import 'package:kimyapar/core/languages/tr.dart';
import 'package:kimyapar/product/utilities/lottie.dart';
import 'package:kimyapar/product/widgets/login/swipeButton.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';
import 'package:slidable_button/slidable_button.dart';

class SingIn extends StatefulWidget {
  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  void click() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MapSelect()),
    );
  }

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
                    Lottiee(),
                    HelloText(),
                    const SizedBox(
                      height: 10,
                    ),
                    PleaseSignText(),
                    const SizedBox(
                      height: 10,
                    ),
                    SwippableBtn(),
                    const SizedBox(
                      height: 20,
                    ),
                    MailField(),
                    const SizedBox(
                      height: 12,
                    ),
                    PassField(),
                    ForgotPass(),
                    LoginButton(),
                    const SizedBox(
                      height: 17,
                    ),
                    SocialLoginBtn()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector LoginButton() {
    return GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      decoration: ContainerStyles.LoginBox,
                      child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: CreateText(
                              text: Tr.signin,
                              style: TextStyles.loginButtonStyle)),
                    ),
                  );
  }

  Padding ForgotPass() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: click,
            child: const Text(
              Tr.forgotPass,
              style: TextStyles.forgotPassStyle,
            ),
          )
        ],
      ),
    );
  }

  SizedBox PassField() {
    return SizedBox(
      width: 260,
      height: 60,
      child: TextField(
        obscureText: true,
        decoration: TextFieldStyles.PassField,
      ),
    );
  }

  SizedBox MailField() {
    return SizedBox(
        width: 260,
        height: 60,
        child: TextField(
          decoration: TextFieldStyles.MailField,
        ));
  }

  SwippableButton SwippableBtn() {
    return const SwippableButton(position: SlidableButtonPosition.start);
  }

  CreateText PleaseSignText() {
    return const CreateText(
        text: Tr.pleaseSignin, style: TextStyles.pleaseSignIn);
  }

  CreateText HelloText() {
    return const CreateText(text: Tr.hello, style: TextStyles.helloStyle);
  }

  Row SocialLoginBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SignInButton(
          text: Tr.forgotPass,
          Buttons.Google,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  SizedBox Lottiee() {
    return const SizedBox(
      height: 175,
      width: 175,
      child: LottieProgress(path: AppPaths.login),
    );
  }
}
