import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';

class CustomWidgets {
  Widget customSubmitButton({required String text, required Color color, Color? textColor}) {
    return Container(
      width: 330,
      height: 50,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          text,
          style: CustomTheme.lightTheme().textTheme.bodyMedium!.copyWith(color: textColor),
        ),
      ),
    );
  }

  Widget sortingWidget({double paddingH = 14, double paddingV = 4,double? height, double? width, IconData? icon, TextStyle? textStyle, required String text, Color backgroundColor = CustomColor.secondaryColor, Color textColor = Colors.white}) {
    return Container(
      height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: CustomColor.secondaryColor, width: 1)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon != null ? Icon(icon) : Container(), Text(text,style: textStyle,)],
        ));
  }

  Widget productCategory({double? height, double? width,required String img, required String title}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          height: width,
          width:width,
          child: Image.asset(img,fit: BoxFit.fill,),
        ),
        Container(
          height: width,
          width: width,
          color: Colors.black.withOpacity(0.4),
          child: Center(child: Text(title,style: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 14),)),
        )
      ],
    );
  }

  Widget showProduct({required ProductModel product}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 205,
      width: 160,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey[300]! ,width: 1)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(9),topRight: Radius.circular(9)),
              child: Image.asset(
                product.img.toString(),
                width: double.infinity,
                fit: BoxFit.fill
                ,
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.symmetric(horizontal:2,vertical: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                SizedBox(height: 5,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      // backgroundImage: product.traderLogoImg != "" ? AssetImage(product.traderLogoImg.toString()) : null,
                      backgroundColor: CustomColor.mainColor,
                      radius: 10,
                      child: const Text(
                        "T",
                        style: TextStyle(color: CustomColor.secondaryColor),
                      ),
                    ),
                    Text(product.traderName),
                    // Expanded(child: Container()),
                    product.prevPrice != null ? Text(product.prevPrice!) : Container(),
                    Text(
                      product.price,
                      style: const TextStyle(color: CustomColor.mainColor),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget authTextField({String? hintText, TextCapitalization textCapital = TextCapitalization.none, String? labelText}) {
    return TextFormField(
        style: GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w400, fontSize: 18),
        textCapitalization: textCapital,
        cursorColor: CustomColor.secondaryColor,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid)),
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w400, fontSize: 18)));
  }
}
