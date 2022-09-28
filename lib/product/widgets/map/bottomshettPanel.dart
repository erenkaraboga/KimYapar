import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';

import '../../../view/user_order/viewmodel/controllers/controller.dart';

final loginController = Get.find<LoginController>();
final orderController = Get.find<OrderController>();

mapPanel(ScrollController sc, BuildContext context) {
  return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        controller: sc,
        children: <Widget>[
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[Icon(CupertinoIcons.chevron_up)],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.toNamed("/timeline");
                },
                child: Text("Kim Yapar!",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 19.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 10, 80, 20),
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                  autofocus: true,
                  style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shape: const StadiumBorder(),
                      primary: Colors.orange.shade300),
                  onPressed: () {
                    Get.toNamed("/addOrder");
                    //orderController.addOrder("Patatesli yumurta");
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "Sipariş et",
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Get.toNamed("/order");
                      },
                      child: GestureDetector(
                          child: _button(
                              "Siparişlerim", Icons.restaurant, Colors.red))),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed('/chefOrder');
                      },
                      child: _button("Bana Gelen Sipariş", Icons.people_alt,
                          Colors.amber)),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed('/profile');
                      },
                      child: _button("Profilim", Icons.person, Colors.green)),
                  GestureDetector(
                    child: _button("Çıkış Yap", Icons.logout, Colors.purple),
                    onTap: () {
                      loginController.signOut();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              const Text(
                " darksoft v1.0.0 beta ",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ));
}

Widget _button(String label, IconData icon, Color color) {
  return Column(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 8.0,
              )
            ]),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 12.0,
      ),
      Text(label),
    ],
  );
}
