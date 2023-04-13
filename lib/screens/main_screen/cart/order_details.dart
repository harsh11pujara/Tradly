import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tradly/models/address_model.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/screens/main_screen/app_navigator_screen.dart';
import 'package:tradly/utilities/themes.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.address}) : super(key: key);
  final AddressModel address;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
        automaticallyImplyLeading: false,
        title: Text(
          "Order Details",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigatorScreen(),
                  ),
                  (route) => false);
            },
            icon: const Icon(Icons.close, color: CustomColor.secondaryColor),
            padding: EdgeInsets.zero,
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 31,
              ),
              SizedBox(
                  height: 101,
                  width: 160,
                  child: SvgPicture.asset(
                    "assets/images/orderProcessed.svg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 7,
              ),
              Text(
                "Thanks for Order",
                style: CustomTheme.lightTheme().textTheme.titleLarge!.copyWith(color: CustomColor.customBlack),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newProduct.length,
                itemBuilder: (context, index) {
                  return showCartProduct(index);
                },
              )),
              Container(
                height: 404,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                margin: const EdgeInsets.only(top: 16, bottom: 24),
                decoration: BoxDecoration(color: CustomColor.secondaryColor, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Track Order",
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 16, color: const Color(0xFF212121))),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Order ID - 123455",
                        style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: const Color(0xFF606A7B))),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                        width: 68,
                        child: Divider(
                          color: CustomColor.mainColor,
                          thickness: 3,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    TimelineTile(

                      indicatorStyle: IndicatorStyle(color: CustomColor.mainColor,),
                      afterLineStyle: LineStyle(color: CustomColor.mainColor),
                      endChild: Container(height: 70, child: Text("hii")),
                      isFirst: true,
                    ),
                    TimelineTile(
                      beforeLineStyle: LineStyle(color: Colors.orange),
                      indicatorStyle: IndicatorStyle(color: CustomColor.mainColor,),
                      // afterLineStyle: LineStyle(color: CustomColor.mainColor),
                      endChild: Container(height: 70, child: Text("hii")),
                    ),
                    TimelineTile(
                      // beforeLineStyle:  LineStyle(color: CustomColor.mainColor),

                      endChild: Container(height: 70, child: Text("hii")),
                    ),
                    TimelineTile(
                      endChild: Container(height: 70, child: Text("hii")),
                      isLast: true,
                    ),
                    // Stepper(
                    //     controlsBuilder: (context, details) {
                    //       return Row(
                    //         children: <Widget>[
                    //           Container(
                    //             child: null,
                    //           ),
                    //           Container(
                    //             child: null,
                    //           ),
                    //         ], // <Widget>[]
                    //       );
                    //     },
                    //     steps: [
                    //       Step(
                    //         label: const CircleAvatar(
                    //           backgroundColor: Colors.blue,
                    //         ),
                    //         title: const Text(''),
                    //         content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                    //       ),
                    //       const Step(
                    //
                    //         title: Text('Step 2 title'),
                    //         content: Text('Content for Step 2'),
                    //       ),
                    //     ])
                  ],
                ),
              ),
              Container(
                height: 146,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: CustomColor.secondaryColor, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 16, bottom: 13, left: 18, right: 18),
                      child: Text(
                        "Delivery Address",
                        style: CustomTheme.lightTheme().textTheme.displaySmall!.copyWith(fontSize: 16),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: CustomColor.backgroundColor,
                    ),
                    Expanded(
                      // padding: EdgeInsets.only(top: 11,left: 18),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Tradly team",
                              style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: CustomColor.textFieldColor),
                            ),
                            Text(
                              "Flat Number 512, Eden Garden, Rewari",
                              style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: const Color(0xFF606A7B)),
                            ),
                            Row(
                              children: [
                                Text("Mobile:",
                                    style:
                                        CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: const Color(0xFF606A7B))),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text("9876543210",
                                    style:
                                        CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: const Color(0xFF333942)))
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigatorScreen(),
                      ),
                      (route) => false);
                },
                child: Text("Back to Home",
                    style: CustomTheme.lightTheme().textTheme.displaySmall!.copyWith(
                          fontSize: 16,
                          color: const Color(0xFF212121),
                        )),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showCartProduct(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 155,
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
                        newProduct[index].img.toString(),
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
        ],
      ),
    );
  }
}
