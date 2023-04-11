import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradly/models/address_model.dart';
import 'package:tradly/models/card_model.dart';
import 'package:tradly/screens/main_screen/cart/create_card.dart';
import 'package:tradly/screens/main_screen/cart/order_details.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class PaymentOption extends StatefulWidget {
  PaymentOption({Key? key, required this.address, this.cardDetails}) : super(key: key);
  CardModel? cardDetails;
  final AddressModel address;

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  String radioValue = "Debit / Credit Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Payment Option",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => CreateCard(address: widget.address)));
                  },
                  child: Container(
                    color: CustomColor.secondaryColor,
                    margin: const EdgeInsets.only(top: 16, bottom: 6),
                    height: 241,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              widget.cardDetails == null
                                  ? Container()
                                  : SizedBox(
                                      height: 195,
                                      width: 320,
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                              height: 183,
                                              width: 309,
                                              child: SvgPicture.asset(
                                                "assets/images/mastercard.svg",
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              )),
                                          const Positioned(
                                            bottom: 0,
                                            right: 6,
                                            child: CircleAvatar(
                                              backgroundColor: CustomColor.secondaryColor,
                                              radius: 12,
                                              child: CircleAvatar(
                                                backgroundColor: CustomColor.authButtonColor,
                                                radius: 10,
                                                child: Icon(Icons.check, color: CustomColor.secondaryColor, size: 15),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                              const SizedBox(
                                width: 20,
                              ),
                              DottedBorder(
                                radius: const Radius.circular(10),
                                color: CustomColor.productTextBlack.withOpacity(0.3),
                                borderType: BorderType.RRect,
                                dashPattern: [3, 3],
                                strokeWidth: 1.5,
                                child: SizedBox(
                                  height: 146,
                                  width: 246,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: CustomColor.productTextBlack.withOpacity(0.3),
                                      ),
                                      Text(
                                        "Add Payment Method",
                                        style: CustomTheme.lightTheme().textTheme.bodySmall,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: CustomColor.authButtonColor.withOpacity(1),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: CustomColor.authButtonColor.withOpacity(0.4),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: CustomColor.authButtonColor.withOpacity(0.4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: CustomColor.secondaryColor,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        leading: Radio<String>(
                          value: "Debit / Credit Card",
                          onChanged: (value) {
                            setState(() {
                              radioValue = value.toString();
                            });
                          },
                          activeColor: CustomColor.authButtonColor,
                          groupValue: radioValue,
                        ),
                        title: const Text("Debit / Credit Card"),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: "Netbanking",
                          onChanged: (value) {
                            setState(() {
                              radioValue = value.toString();
                            });
                          },
                          activeColor: CustomColor.authButtonColor,
                          groupValue: radioValue,
                        ),
                        title: const Text("Netbanking"),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: "Cash on Delivery",
                          onChanged: (value) {
                            setState(() {
                              radioValue = value.toString();
                            });
                          },
                          activeColor: CustomColor.authButtonColor,
                          groupValue: radioValue,
                        ),
                        title: const Text("Cash on Delivery"),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: "Wallet",
                          onChanged: (value) {
                            setState(() {
                              radioValue = value.toString();
                            });
                          },
                          activeColor: CustomColor.authButtonColor,
                          groupValue: radioValue,
                        ),
                        title: const Text("Wallet"),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 4),
                  margin: const EdgeInsets.only(top: 8),
                  height: 65,
                  color: CustomColor.secondaryColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deliver to ${widget.address!.name}, ${widget.address!.pin}",
                              style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: Colors.black),
                              softWrap: true,
                            ),
                            Text(
                              "${widget.address!.city},${widget.address!.state}",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: CustomColor.productTextBlack.withOpacity(0.7)),
                              softWrap: true,
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: 30,
                          child: CustomWidgets().sortingWidget(
                              text: "Change",
                              paddingH: 23,
                              backgroundColor: CustomColor.mainColor,
                              paddingV: 2,
                              textStyle: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(fontSize: 12)))
                    ],
                  ),
                ),
                Container(
                  /// TOTAL PRICE DETAILS CONTAINER
                  margin: const EdgeInsets.only(top: 8),
                  color: CustomColor.secondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price Details",
                          style: CustomTheme.lightTheme().textTheme.displaySmall!.copyWith(fontSize: 18, color: Colors.black)),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Price (3 item)",
                              style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: Colors.black)),
                          Text(
                            "\$100",
                            style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: Colors.black),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery Fee",
                              style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: Colors.black)),
                          Text(
                            "Info",
                            style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: Colors.black),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Divider(
                        color: CustomColor.customBlack.withOpacity(0.2),
                        height: 2,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style: CustomTheme.lightTheme().textTheme.displaySmall!.copyWith(fontSize: 18, color: Colors.black),
                          ),
                          Text(
                            "\$105",
                            style: CustomTheme.lightTheme().textTheme.titleLarge!.copyWith(fontSize: 18, color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
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
                    if (widget.cardDetails != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetails(address: widget.address),
                          ));
                    }
                  },
                  child: CustomWidgets().sortingWidget(
                      text: "Checkout",
                      backgroundColor: CustomColor.mainColor.withOpacity(widget.cardDetails == null ? 0.3 : 1),
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
