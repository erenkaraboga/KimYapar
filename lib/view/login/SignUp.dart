import 'package:flutter/material.dart';
import 'package:kimyapar/core/constants/styles.dart';
import 'package:kimyapar/product/utilities/validate/validate.dart';
import 'package:kimyapar/product/widgets/login/loginWidgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  @override
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
                      LoginWidgets.Lottiee(),
                      LoginWidgets.HelloText(),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginWidgets.PleaseSignText(),
                      const SizedBox(
                        height: 10,
                      ),
                      LoginWidgets.SwippableBtn(),
                      const SizedBox(
                        height: 20,
                      ),
                      LoginWidgets.MailField(Validate.emailValidator),
                      const SizedBox(
                        height: 12,
                      ),
                      LoginWidgets.PassField(Validate.passwordValidator),
                      LoginWidgets.ForgotPass(),
                      LoginWidgets.LoginButton(_formKey, context),
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
}
