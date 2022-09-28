import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimyapar/product/widgets/order/orderDetail/handle_button.dart';

import '../../../../view/login/viewmodel/controllers/loginController.dart';
import '../../../../view/user_order/viewmodel/controllers/controller.dart';

final loginController = Get.find<LoginController>();
final orderController = Get.find<OrderController>();
orderPanel(ScrollController sc, BuildContext context) {
  return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: sc,
        children: <Widget>[
          const SizedBox(
            height: 12.0,
          ),
          const Icon(CupertinoIcons.chevron_up),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // NotificationHelper.showNotification(id: 1,title: "Deneme",body: "Deneme");
                },
                child: Text("Şef Paneli",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ],
          ),
          const IHandleButton(),
        ],
      ));
}
