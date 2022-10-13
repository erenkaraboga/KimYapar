import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/product/utilities/lottie.dart';
import 'package:kimyapar/product/widgets/login/signIn/swipeButton.dart';
import 'package:kimyapar/product/widgets/login/signUp/swipeButton.dart';

import '../../../core/base/text.dart';

import '../../../core/constants/styles/text.dart';
import '../../../core/languages/tr.dart';

forgotPass() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Get.offNamed("/signInNew");
          },
          child: Text(
            Tr.forgotPass,
            style: forgotPassStyle(),
          ),
        )
      ],
    ),
  );
}

SwippableBtnUP() {
  return const SwippableButtonUP();
}

SwippableBtnIN() {
  return const SwippableButtonIN();
}

PleaseSignText() {
  return CreateText(text: Tr.pleaseSignin, style: pleaseSignIn());
}

HelloText() {
  return CreateText(text: Tr.hello, style: helloStyle());
}

SocialLoginBtn() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SignInButton(
        text: Tr.loginWithGoogle,
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

LottieLogin() {
  return const SizedBox(
    height: 175,
    width: 175,
    child: LottieProgress(path: AppPaths.login),
  );
}

LottieLoginSuccess() {
  return const SizedBox(
    width: 175,
    child: LottieProgress(path: AppPaths.loginsuccess),
  );
}
