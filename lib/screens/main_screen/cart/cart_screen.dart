import 'package:flutter/material.dart';
import 'package:tradly/models/address_model.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/screens/main_screen/cart/create_address.dart';
import 'package:tradly/screens/main_screen/cart/payment_option.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key, this.address}) : super(key: key);
  AddressModel? address;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductModel> newProduct = [
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "My Cart",
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
            child: Column(
              children: [
                widget.address == null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CreateAddress(),));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 52,
                          color: CustomColor.secondaryColor,
                          child: Center(
                              child: Text(
                            "+ Add New Address",
                            style: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(color: CustomColor.customBlack),
                          )),
                        ))
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 19,vertical: 4),
                        margin: const EdgeInsets.only(bottom: 10),
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
                                  Text("${widget.address!.city},${widget.address!.state}",style: CustomTheme.lightTheme()
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: CustomColor.productTextBlack.withOpacity(0.7)),softWrap: true,)
                                ],
                              ),
                            ),
                            Container(height: 30,child: CustomWidgets().sortingWidget(text: "Change", paddingH: 23,backgroundColor: CustomColor.mainColor,paddingV: 2,textStyle: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(fontSize: 12)))
                          ],
                        ),
                      ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newProduct.length,
                  itemBuilder: (context, index) {
                    return showCartProduct(index);
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
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
                          Text("Price (${newProduct.length} item)",
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
                  height: 80,
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
                    if(widget.address != null){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentOption(),));
                    }
                  },
                  child: CustomWidgets().sortingWidget(
                      text: "Continue to Payment",
                      backgroundColor: CustomColor.mainColor.withOpacity(widget.address == null ? 0.3 : 1),
                      // paddingH: 100,
                      paddingV: 15,
                      textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 18)),
                ),
              ))
        ],
      ),
    );
  }

  Widget showCartProduct(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 183,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 26),
      color: CustomColor.secondaryColor,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 102,
                  width: 102,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        newProduct[index].img,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newProduct[index].name,
                    style: CustomTheme.lightTheme().textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${newProduct[index].price}   ",
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: CustomColor.mainColor, fontSize: 18),
                      ),
                      Text("\$25 ",
                          style: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(
                              decoration: TextDecoration.lineThrough, color: CustomColor.productTextBlack.withOpacity(0.7))),
                      Text("50% off",
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.productTextBlack.withOpacity(0.7))),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      const Text("Qty:  "),
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Divider(
            color: CustomColor.customBlack.withOpacity(0.2),
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Remove",
            style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: CustomColor.productTextBlack.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
