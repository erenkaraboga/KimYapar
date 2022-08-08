import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kimyapar/core/constants/path.dart';
import 'package:kimyapar/product/utilities/lottie.dart';
import 'package:kimyapar/product/widgets/login/swipeButton.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';
import 'package:slidable_button/slidable_button.dart';

import '../../../core/base/text.dart';
import '../../../core/constants/styles.dart';
import '../../../core/languages/tr.dart';

class LoginWidgets {
  static LoginButton(GlobalKey<FormState> formKey, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapSelect()),
          );
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

  static PassField(MultiValidator passwordValidator) {
    return SizedBox(
      width: 260,
      height: 60,
      child: TextFormField(
        obscureText: true,
        validator: passwordValidator,
        decoration: TextFieldStyles.PassField,
      ),
    );
  }

  static MailField(MultiValidator emailValidator) {
    return SizedBox(
        width: 260,
        height: 60,
        child: TextFormField(
          validator: emailValidator,
          decoration: TextFieldStyles.MailField,
        ));
  }

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

  static SwippableBtn() {
    return const SwippableButton(position: SlidableButtonPosition.start);
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

  static Lottiee() {
    return const SizedBox(
      height: 175,
      width: 175,
      child: LottieProgress(path: AppPaths.login),
    );
  }
}
