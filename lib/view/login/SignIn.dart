import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kimyapar/core/base/text.dart';
import 'package:kimyapar/core/constants/styles.dart';
import 'package:kimyapar/core/languages/tr.dart';
import 'package:kimyapar/product/widgets/swipeButton.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';
import 'package:lottie/lottie.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: ContainerStyles.backround,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Container(
                width: width2,
                height: 620,
                decoration: ContainerStyles.backroundBox,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottiee(),
                    const CreateText(
                        text: Tr.hello, style: TextStyles.helloStyle),
                    const SizedBox(
                      height: 10,
                    ),
                    const CreateText(
                        text: Tr.pleaseSignin, style: TextStyles.pleaseSignIn),
                    const SizedBox(
                      height: 10,
                    ),
                    const SwippableButton(
                        position: SlidableButtonPosition.start),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 260,
                      height: 60,
                      child: TextField(
                        decoration: TextFieldStyles.MailField,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      width: 260,
                      height: 60,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.eyeSlash,
                              color: Colors.red,
                            ),
                            labelText: Tr.pass,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: click,
                            child: const Text(
                              "Şifremi unuttum",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.deepOrangeAccent),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            Tr.signin,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    SocialLogin()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row SocialLogin() {
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
    return SizedBox(
        child: Lottie.network(
      "https://assets3.lottiefiles.com/packages/lf20_hsis9re9.json",
      height: 175,
      width: 175,
    ));
  }
}
