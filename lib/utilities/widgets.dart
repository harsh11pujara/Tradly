import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';

class CustomWidgets {
  Widget customSubmitButton(
      {required String text, required Color color, required Color textColor}) {
    return Container(
      width: 200,
      height: 40,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  Widget sortingWidget(
      {IconData? icon,
      required String text,
      Color backgroundColor = CustomColor.secondaryColor}) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: CustomColor.secondaryColor, width: 3)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon != null ? Icon(icon) : Container(), Text(text)],
        ));
  }

  Widget productCategory({required String img, required String title}) {
    return Stack(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Image.asset(img),
        ),
        Container(
          height: 40,
          width: 40,
          color: Colors.black.withOpacity(0.4),
          child: Center(child: Text(title)),
        )
      ],
    );
  }

  Widget showProduct({required ProductModel product}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.asset(
            product.img,
            fit: BoxFit.fill,
            height: 140,
            width: 120,
          ),
          Text(product.name),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: product.traderLogoImg != null
                    ? AssetImage(product.traderLogoImg!)
                    : null,
                backgroundColor: CustomColor.mainColor,
                child: const Text(
                  "T",
                  style: TextStyle(color: CustomColor.secondaryColor),
                ),
              ),
              Text(product.traderName),
              Expanded(child: Container()),
              product.prevPrice != null
                  ? Text(product.prevPrice!)
                  : Container(),
              Text(
                product.price,
                style: const TextStyle(color: CustomColor.mainColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
