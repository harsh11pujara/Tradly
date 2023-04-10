import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            FloatingActionButton.small(
              heroTag: "back btn",
              elevation: 0.5,
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: const Icon(Icons.arrow_back_sharp),
            ),
            Expanded(child: Container()),
            FloatingActionButton.small(
              heroTag: "share btn",
              elevation: 0.5,
              onPressed: () {},
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: const Icon(Icons.share),
            ),
            FloatingActionButton.small(
              heroTag: "wishlist btn",
              elevation: 0.5,
              onPressed: () {},
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: const Icon(Icons.favorite_border_sharp),
            ),
            FloatingActionButton.small(
              heroTag: "more btn",
              elevation: 0.5,
              onPressed: () {},
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: const Icon(Icons.more_vert),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 275,
                    width: double.infinity,
                    child: Image.asset(
                      widget.product.img,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Container(
                  color: CustomColor.secondaryColor,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: CustomTheme.lightTheme().textTheme.headlineMedium!.copyWith(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${widget.product.price}",
                            style: CustomTheme.lightTheme()
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: 20, color: CustomColor.mainColor),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Text("\$25 ",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(decoration: TextDecoration.lineThrough, color: CustomColor.productTextBlack)),
                          Text("50% off",
                              style:
                                  CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(color: CustomColor.productTextBlack)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                  color: CustomColor.secondaryColor,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: widget.product.traderLogoImg.toString() != "" && widget.product.traderLogoImg != null
                            ? AssetImage(widget.product.traderLogoImg.toString())
                            : null,
                        backgroundColor: CustomColor.mainColor,
                        radius: 16,
                        child: const Text(
                          "T",
                          style: TextStyle(color: CustomColor.secondaryColor, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Text(
                        widget.product.traderName,
                        style:
                            CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(fontSize: 16, color: CustomColor.customBlack),
                      ),
                      Expanded(child: Container()),
                      CustomWidgets().sortingWidget(
                          text: "Follow",
                          paddingH: 23,
                          backgroundColor: CustomColor.mainColor,
                          textStyle: CustomTheme.lightTheme().textTheme.titleSmall)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
                  decoration: BoxDecoration(
                    color: CustomColor.secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lobortis cras placerat diam ipsum ut. Nisi vel adipiscing massa bibendum diam. Suspendisse mattis dui maecenas duis mattis. Mattis aliquam at arcu, semper nunc, venenatis et pellentesque eu. Id tristique maecenas tristique habitasse eu elementum sed. Aliquam eget lacus, arcu, adipiscing eget feugiat in dolor sagittis.Non commodo, a justo massa porttitor sed placerat in. Orci tristique etiam tempus sed. Mi varius morbi egestas dictum tempor nisl. In ",
                    style: CustomTheme.lightTheme().textTheme.bodySmall,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: const BoxDecoration(
                    color: CustomColor.secondaryColor,
                  ),
                  child: Table(
                    columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(4)},
                    children: [
                      TableRow(children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text("Condition", style: CustomTheme.lightTheme().textTheme.bodySmall)),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text("Organic",
                                style:
                                    CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(color: CustomColor.productTextBlack))),
                      ]),
                      TableRow(children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text("Price type", style: CustomTheme.lightTheme().textTheme.bodySmall)),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text("Fixed",
                                style:
                                    CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(color: CustomColor.productTextBlack))),
                      ]),
                      TableRow(children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text("Category", style: CustomTheme.lightTheme().textTheme.bodySmall)),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text("Beverages",
                                style:
                                    CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(color: CustomColor.productTextBlack))),
                      ]),
                      TableRow(children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text("Location", style: CustomTheme.lightTheme().textTheme.bodySmall)),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Kualalumpur, Malaysia",
                              style: CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(color: CustomColor.productTextBlack),
                            )),
                      ]),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: CustomColor.secondaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Additional Details",
                        style: CustomTheme.lightTheme().textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 15,),
                      Table(
                        columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(4)},
                        children: [
                          TableRow(children: [
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Text("Delivery Details", style: CustomTheme.lightTheme().textTheme.bodySmall)),
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Home Delivery Available, Cash On Delivery",
                                  style:
                                      CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(color: CustomColor.productTextBlack),
                                )),
                          ]),
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
                child: CustomWidgets().sortingWidget(
                    text: "Add To cart",
                    backgroundColor: CustomColor.mainColor,
                    // paddingH: 100,
                    paddingV: 15,
                    textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 18)),
              ))
        ],
      ),
    );
  }
}
