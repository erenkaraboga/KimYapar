import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimyapar/view/login/viewmodel/controllers/loginController.dart';

import '../../../core/constants/styles.dart';
final loginController = Get.find<LoginController>();
panel(ScrollController sc, BuildContext context) {
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
              Text("Kim Yapar!",
                  style: GoogleFonts.kalam(
                    fontSize: 25,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
          const SizedBox(
            height: 19.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
            child: Form(
                child: TextFormField(
              decoration: TextFieldStyles.orderField,
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 10, 80, 20),
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                  autofocus: true,
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: Colors.orange.shade300),
                  onPressed: () {},
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
                  _button("Siparişlerim", Icons.restaurant, Colors.red),
                  _button("Şefler", Icons.people_alt, Colors.amber),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed("/profile");
                      },
                      child: _button("Profilim", Icons.person, Colors.green)),
                  GestureDetector(child: _button("Çıkış Yap", Icons.logout, Colors.purple),
                  onTap: (){
                    loginController.signOut();
                  },),
                ],
              
          )],
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
