import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    return ThemeData(

        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: CustomColor.secondaryColor),
            ),
            hintStyle: GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w400, fontSize: 18)),
        textTheme: TextTheme(
            bodyMedium: GoogleFonts.montserrat(color: CustomColor.mainColor, fontSize: 20, fontWeight: FontWeight.w500),
            labelMedium: GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w400, fontSize: 18),
          labelLarge: GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w600, fontSize: 26),
          headlineMedium: GoogleFonts.montserrat(color: CustomColor.customBlack,fontSize: 18,fontWeight: FontWeight.w600),
          titleSmall: GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontSize: 14,fontWeight: FontWeight.w500)
        ));
  }
}

class CustomColor {
  static const mainColor = Color(0xFF33907C); //green
  static const secondaryColor = Color(0xFFFFFFFF); //white
  static const authButtonColor = Color(0xFF13B58C);
  static const customBlack = Color(0xFF4F4F4F);

}
