import 'package:flutter/material.dart';

class CustomWidgets{

  Widget customSubmitButton({required String text, required Color color, required Color textColor}){
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(40)),
      child: Center(child: Text(text,style: TextStyle(color: textColor),),),
    );
  }
}

