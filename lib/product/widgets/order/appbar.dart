import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

appBar(String text) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    titleSpacing: 5,
    title: Text(
      text,
      style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 20),
    ),
    elevation: 3,
  );
}

appBarWithPath(String text, String path) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    titleSpacing: 5,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: const Icon(
            Icons.history,
            color: Colors.orange,
          ),
          onTap: () {
            Get.toNamed(path);
          },
        ),
      )
    ],
    title: Text(
      text,
      style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 20),
    ),
    elevation: 3,
  );
}
