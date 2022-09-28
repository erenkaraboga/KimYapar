import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

appBar(String text) {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    titleSpacing: 5,
    actions: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.history),
      )
    ],
    title: Text(
      text,
      style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 20),
    ),
    elevation: 3,
  );
}
