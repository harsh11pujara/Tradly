import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/models/store_model.dart';
import 'package:tradly/screens/main_screen/product_detail_screen.dart';
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

  Widget sortingWidget(
      {double paddingH = 14,
      double paddingV = 4,
      double? height,
      double? width,
      IconData? icon,
      TextStyle? textStyle,
      required String text,
      Color backgroundColor = CustomColor.secondaryColor,
      Color textColor = Colors.white}) {
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
          children: [
            icon != null ? Icon(icon,color: CustomColor.secondaryColor,) : Container(),
            Text(
              text,
              style: textStyle,
            )
          ],
        ));
  }

  Widget productCategory({double? height, double? width, required String img, required String title}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          height: width,
          width: width,
          child: Image.asset(
            img,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Container(
          height: width,
          width: width,
          color: Colors.black.withOpacity(0.4),
          child: Center(
              child: Text(
            title,
            style: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 14),
          )),
        )
      ],
    );
  }

  Widget showProduct({required BuildContext context,required ProductModel product, Color? borderColor}) {
    // var imgDecode
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: product),));
      },
      child: Container(
        height: 300,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all(color: borderColor ?? Colors.grey[300]!, width: 1)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 145,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9)),
                child: Image.asset(
                  product.img.toString(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(padding: EdgeInsets.symmetric(horizontal: 12,),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(color: CustomColor.productTextBlack)),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: product.traderLogoImg.toString() != "" && product.traderLogoImg != null
                              ? AssetImage(product.traderLogoImg.toString())
                              : null,
                          backgroundColor: CustomColor.mainColor,
                          radius: 10,
                          child: const Text(
                            "T",
                            style: TextStyle(color: CustomColor.secondaryColor),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          product.traderName,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                        ),
                        // Expanded(child: Container()),
                        product.prevPrice != null ? Text(product.prevPrice!) : Container(),
                        Expanded(child: Container()),
                        Text(
                          "\$${product.price}",
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: CustomColor.mainColor, fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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

  Widget storeFollowWidget(StoreModel store) {
    return Container(
      height: 255,
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(

        boxShadow: [BoxShadow(blurRadius: 0.1,spreadRadius: 0.1,color: Colors.grey,offset: Offset(0,0)),
     ],
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(9), topRight: Radius.circular(9)),
                child: Image.asset(
                  store.img.toString(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 38,
                  child: CircleAvatar(
                    backgroundImage: store.storeLogoImg.toString() != "" && store.storeLogoImg != null
                        ? AssetImage(store.storeLogoImg.toString())
                        : null,
                    backgroundColor: CustomColor.mainColor,
                    radius: 36,
                    child: const Text(
                      "T",
                      style: TextStyle(color: CustomColor.secondaryColor, fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: 7,),
                Text(store.name,style: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(color: CustomColor.productTextBlack),),
                const SizedBox(height: 15,),
                CustomWidgets().sortingWidget(text: "Follow" , backgroundColor: CustomColor.mainColor,textStyle: CustomTheme.lightTheme().textTheme.titleSmall,paddingH: 23,paddingV: 5)
              ],
            ),
          )
        ],
      ),
    );
  }
}
