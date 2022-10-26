import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/colors.dart';
import 'package:kimyapar/product/routes/app_routes.dart';
import 'package:kimyapar/product/utilities/qr_code/qr_code_scanner.dart';
import 'package:kimyapar/view/add_order/add_order.dart';

import 'package:kimyapar/view/chats/view/chatdetails.dart';
import 'package:kimyapar/view/chats/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/deneme/deneme.dart';

import 'package:kimyapar/view/login/view/SignIn.dart';
import 'package:kimyapar/view/login/view/SignUp.dart';
import 'package:kimyapar/view/login/view/new/signIn.dart';
import 'package:kimyapar/view/login/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/map/view/mapPage.dart';
import 'package:kimyapar/view/map/viewmodel/bindings/binding.dart';

import 'package:kimyapar/view/profile/view/profileScreen.dart';
import 'package:kimyapar/view/profile/viewmodel/bindings/binding.dart';
import 'package:kimyapar/view/user_order/view/chef/chefOrders.dart';
import 'package:kimyapar/view/user_order/view/chef/orderDetail.dart';

import 'package:kimyapar/view/user_order/view/user/orderPage.dart';
import 'package:kimyapar/view/user_order/view/status/error.dart';
import 'package:kimyapar/view/user_order/view/status/success.dart';
import 'package:kimyapar/view/user_order/viewmodel/bindings/binding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KimYapar());
}

class KimYapar extends StatelessWidget {
  const KimYapar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: AppColors.appBarColor),
        ),
        initialRoute: "/loading",
        initialBinding: MapBinding(),
        getPages: appRoutes());
  }
}
