import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/colors.dart';
import 'package:kimyapar/view/chats/view/chatScreen.dart';
import 'package:kimyapar/view/chats/view/chatdetails.dart';
import 'package:kimyapar/view/chats/viewmodel/bindings/binding.dart';

import 'package:kimyapar/view/login/view/SignIn.dart';
import 'package:kimyapar/view/login/view/SignUp.dart';
import 'package:kimyapar/view/login/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/map/model/UserModel.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';
import 'package:kimyapar/view/map/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/order/view/orderPage.dart';
import 'package:kimyapar/view/order/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/profile/view/profileScreen.dart';
import 'package:kimyapar/view/profile/viewmodel/bindings/binding.dart';

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
      initialRoute: "/map",
      initialBinding: MapBinding(),
      getPages: [
        GetPage(
            name: "/map", page: () => const MapSelect(), binding: MapBinding()),
        GetPage(
          name: "/signIn",
          page: () => SingIn(),
          binding: LoginBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
        GetPage(
          name: "/profile",
          page: () => const ProfilePage(),
          binding: ProfileBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
        GetPage(
          name: "/chatDetail",
          page: () => const ChatDetail(),
          binding: ChatBinding(),
        ),
        GetPage(
          name: "/order",
          page: () => const Orders(),
          binding: OrderBinding(),
        ),
        GetPage(
          name: "/chat",
          page: () => const Chats(),
          binding: ChatBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
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
