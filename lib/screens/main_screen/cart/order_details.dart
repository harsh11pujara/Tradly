import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
import 'package:tradly/models/address_model.dart';
import 'package:tradly/models/product_model.dart';
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
            onPressed: () {},
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
                color: CustomColor.secondaryColor,
                margin: const EdgeInsets.only(top: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Track Order"),
                    const Text("Order ID - 123455"),
                    const SizedBox(
                        width: 68,
                        child: Divider(
                          color: CustomColor.mainColor,
                          thickness: 3,
                        )),
                    Stepper(
                        controlsBuilder: (context, details) {

                          return Row(
                            children: <Widget>[
                              Container(
                                child: null,
                              ),
                              Container(
                                child: null,
                              ),
                            ], // <Widget>[]
                          );
                        },
                        steps: [

                          Step(
                            label: const CircleAvatar(
                              backgroundColor: Colors.blue,
                            ),
                            title: const Text(''),
                            content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
                          ),
                          const Step(
                            title: Text('Step 2 title'),
                            content: Text('Content for Step 2'),
                          ),
                        ])
                  ],
                ),
              )
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
        ],
      ),
    );
  }
}
