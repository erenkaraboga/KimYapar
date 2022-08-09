import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/product/utilities/lottie.dart';
import 'package:kimyapar/product/widgets/login/signIn/swipeButton.dart';
import 'package:kimyapar/product/widgets/login/signUp/swipeButton.dart';

import '../../../core/base/text.dart';
import '../../../core/constants/styles.dart';
import '../../../core/languages/tr.dart';

class LoginWidgets {
  static ForgotPass() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              Tr.forgotPass,
              style: TextStyles.forgotPassStyle,
            ),
          )
        ],
      ),
    );
  }

  static SwippableBtnUP() {
    return const SwippableButtonUP();
  }

  static SwippableBtnIN() {
    return const SwippableButtonIN();
  }

  static PleaseSignText() {
    return const CreateText(
        text: Tr.pleaseSignin, style: TextStyles.pleaseSignIn);
  }

  static HelloText() {
    return const CreateText(text: Tr.hello, style: TextStyles.helloStyle);
  }

  static SocialLoginBtn() {
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

  static LottieLogin() {
    return const SizedBox(
      height: 175,
      width: 175,
      child: LottieProgress(path: AppPaths.login),
    );
  }

  static LottieLoginSuccess() {
    return const SizedBox(
      height: 175,
      width: 175,
      child: LottieProgress(path: AppPaths.loginsuccess),
    );
  }
}
