import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/colors.dart';
import 'package:kimyapar/view/chats/view/chatScreen.dart';
import 'package:kimyapar/view/chats/viewmodel/bindings/binding.dart';

import 'package:kimyapar/view/login/view/SignIn.dart';
import 'package:kimyapar/view/login/view/SignUp.dart';
import 'package:kimyapar/view/login/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';
import 'package:kimyapar/view/map/viewmodel/bindings/binding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.appBarColor),
      ),
      initialRoute: "/signIn",
      initialBinding: MapBinding(),
      getPages: [
        GetPage(
            name: "/map", page: () => const MapSelect(), binding: MapBinding()
            // transition: Transition.cupertino
            ),
        GetPage(
          name: "/signIn", page: () => SingIn(),
          binding: LoginBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
          // transition: Transition.cupertino
        ),
        GetPage(
          name: "/chat", page: () => const Chats(),
          binding: ChatBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
          // transition: Transition.cupertino
        ),
        GetPage(
          name: "/signUp", page: () => const SignUp(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
          // transition: Transition.cupertino
        ),
      ],
    );
  }
}
