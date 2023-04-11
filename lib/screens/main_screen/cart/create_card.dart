import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradly/models/address_model.dart';
import 'package:tradly/models/card_model.dart';
import 'package:tradly/screens/main_screen/cart/payment_option.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({Key? key, required this.address}) : super(key: key);
  final AddressModel address;
  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Add Card",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///CARD STACK
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 15,
                        color: CustomColor.mainColor,
                      ),
                      Center(
                        child: SizedBox(
                            height: 183,
                            width: 309,
                            child: SvgPicture.asset(
                              "assets/images/mastercard.svg",
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                      )
                    ],
                  ),

                  /// CARD DETAILS INPUT FIELD
                  Container(
                    height: (MediaQuery.of(context).size.height) * 2 / 4,
                    color: CustomColor.secondaryColor,
                    margin: EdgeInsets.only(top: 57),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 23),
                    child: Column(
                      children: [
                        TextFormField(
                          ///number
                          controller: number,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "Card Number",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        TextFormField(
                          ///name
                          controller: name,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "Name",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                ///exp date
                                controller: expDate,
                                onChanged: (value) {
                                  if (expDate.text.length == 2 && !expDate.text.contains("/")) {
                                    String temp = "${expDate.text}/";
                                    setState(() {
                                      expDate.value = TextEditingValue(
                                        text: temp,
                                        selection: TextSelection.fromPosition(TextPosition(offset: temp.length))
                                      );
                                    });
                                  }

                                },
                                textCapitalization: TextCapitalization.words,
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                                cursorColor: const Color(0xFFDBDBDE),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    enabledBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    focusedBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    label: Text(
                                      "Expires Date",
                                      style: CustomTheme.lightTheme()
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                ///cvv
                                controller: cvv,
                                textCapitalization: TextCapitalization.words,
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                                cursorColor: const Color(0xFFDBDBDE),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    enabledBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    focusedBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    label: Text(
                                      "CVV",
                                      style: CustomTheme.lightTheme()
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                                    )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
                decoration: const BoxDecoration(
                    color: CustomColor.secondaryColor,
                    boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 5, blurRadius: 20, offset: Offset(0, 15))]),
                child: GestureDetector(
                  onTap: () {
                    CardModel card = CardModel(number.text.trim(), name.text.trim(), expDate.text.trim(), cvv
                    .text.trim());
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentOption(address: widget.address,cardDetails: card),));
                  },
                  child: CustomWidgets().sortingWidget(
                      text: "Add Credit Card",
                      backgroundColor: CustomColor.mainColor,
                      // paddingH: 100,
                      paddingV: 15,
                      textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 18)),
                ),
              ))
        ],
      ),
    );
  }
}
