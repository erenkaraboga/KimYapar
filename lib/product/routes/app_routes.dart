import 'package:get/get.dart';
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
import 'package:kimyapar/view/user_order/view/user/complete_orders.dart';

import 'package:kimyapar/view/user_order/view/user/orderPage.dart';
import 'package:kimyapar/view/user_order/view/status/error.dart';
import 'package:kimyapar/view/user_order/view/status/success.dart';
import 'package:kimyapar/view/user_order/viewmodel/bindings/binding.dart';

import '../../view/user_order/view/chef/completedOrders.dart';

appRoutes() => [
      GetPage(name: "/deneme", page: () => const MyApp()),
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
        page: () => MyAccount(),
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
          name: "/addOrder",
          page: () => AddOrder(),
          transition: Transition.cupertino),
      GetPage(
        name: "/chefOrder", page: () => const ChefOrder(),
        binding: OrderBinding(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        // transition: Transition.cupertino
      ),
      GetPage(
          name: "/orderDetail",
          page: () => PackageDeliveryTrackingPage(),
          binding: OrderBinding(),
          transition: Transition.cupertino),
      /**CompletedOrdersByChef */
      GetPage(
        name: "/completeOrderChef", page: () => const CompletedOrdersByChef(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        binding: OrderBinding(),
        // transition: Transition.cupertino
      ),
      GetPage(
        name: "/completeOrder", page: () => const CompleteOrder(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        binding: OrderBinding(),
        // transition: Transition.cupertino
      ),
      GetPage(
        name: "/signUp", page: () => const SignUp(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        // transition: Transition.cupertino
      ),
      GetPage(
        name: "/qr", page: () => const QrScanPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        // transition: Transition.cupertino
      ),
      GetPage(
        name: "/successPage", page: () => const SuccessPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        // transition: Transition.cupertino
      ),
      GetPage(
        name: "/errorPage", page: () => const ErrorPage(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        // transition: Transition.cupertino
      ),
      GetPage(
        name: "/signInNew", page: () => SignInNEW(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600),
        binding: LoginBinding(),
        // transition: Transition.cupertino
      ),
    ];
