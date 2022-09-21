import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/colors.dart';

import 'package:kimyapar/view/chats/view/chatdetails.dart';
import 'package:kimyapar/view/chats/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/deneme/deneme.dart';

import 'package:kimyapar/view/login/view/SignIn.dart';
import 'package:kimyapar/view/login/view/SignUp.dart';
import 'package:kimyapar/view/login/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';
import 'package:kimyapar/view/map/viewmodel/bindings/binding.dart';

import 'package:kimyapar/view/profile/view/profileScreen.dart';
import 'package:kimyapar/view/profile/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/user_order/view/chefOrders.dart';
import 'package:kimyapar/view/user_order/view/orderDetail.dart';
import 'package:kimyapar/view/user_order/view/orderPage.dart';
import 'package:kimyapar/view/user_order/viewmodel/bindings/binding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(KimYapar());
}

class KimYapar extends StatelessWidget {
  KimYapar({Key? key}) : super(key: key);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.appBarColor),
      ),
      initialRoute:"/map",
      initialBinding: MapBinding(),
      getPages: [
        GetPage(name: "/deneme", page:() =>MyApp() ),
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
          page: () =>  MyAccount(),
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
            transition: Transition.cupertino),
            GetPage(
          name: "/chefOrder", page: () => const ChefOrder(),
          binding: OrderBinding(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
          // transition: Transition.cupertino
        ),
        GetPage(
            name: "/chefOrder",
            page: () => const ChefOrder(),
            binding: OrderBinding(),
            transition: Transition.cupertino),
            GetPage(
            name: "/orderDetail",
            page: () =>  PackageDeliveryTrackingPage(),
            binding: OrderBinding(),
            transition: Transition.cupertino),
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
