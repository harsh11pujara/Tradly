import 'package:flutter/material.dart';

class CustomTheme{
  static ThemeData lightTheme(){
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme()

    );
  }
}

class CustomColor{
  static const mainColor = Color(0xFF33907C); //green
  static const secondaryColor = Color(0xFFFFFFFF); //white
}