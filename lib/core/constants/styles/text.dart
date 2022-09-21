import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../responsive.dart';

nameStyle() {
  return const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
}

distanceStyle() {
  return const TextStyle(fontSize: 17, fontWeight: FontWeight.w300);
}

rateStyle() {
  return const TextStyle(fontSize: 45, fontWeight: FontWeight.w400);
}

appbarTextStyle() {
  return const TextStyle(
      wordSpacing: 1,
      letterSpacing: 2,
      fontSize: 20,
      fontWeight: FontWeight.w400);
}

helloStyle() {
  return const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
}

pleaseSignIn() {
  return const TextStyle(
    color: Colors.grey,
    fontSize: 17,
  );
}

forgotPassStyle() {
  return const TextStyle(color: Colors.deepOrange);
}

loginButtonStyle() {
  return const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
}

ksmallTextStyle(BuildContext context) {
  return GoogleFonts.aBeeZee(
    fontSize: Responsive.isTablet(context) ? 15 : 11,
    color: const Color(0xFF8D8E98),
  );
}
kBigStyle(BuildContext context) {
  return GoogleFonts.aBeeZee(
    fontSize: Responsive.isTablet(context) ? 20 : 13,
    color: const Color(0xFF8D8E98),
  );
}
foodNameTextStyle(BuildContext context){
  return GoogleFonts.aBeeZee(
                                            fontSize:
                                                Responsive.isTablet(context)
                                                    ? 19
                                                    : 15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primary,
                                          );
}
