import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<ProductModel> newProduct = [
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: CustomColor.backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Text(
                "Transactions",
                style: CustomTheme.lightTheme().textTheme.headlineMedium!.copyWith(fontSize: 20),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                height: 26,
                width: 107,
                decoration: BoxDecoration(
                  color: CustomColor.mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Januari 2020",
                    style:
                        CustomTheme.lightTheme().textTheme.headlineMedium!.copyWith(fontSize: 13, color: CustomColor.mainColor),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 23,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: newProduct.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  height: 68,
                  color: CustomColor.secondaryColor,
                  child: ListTile(

                    minLeadingWidth: 40,
                    leading: Container(
                      height: 42,
                      width: 42,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(newProduct[index].img.toString(), width: double.infinity, fit: BoxFit.cover),
                      ),
                    ),
                    title: Text(
                      newProduct[index].name,
                      style: CustomTheme.lightTheme().textTheme.labelSmall,
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "\$${newProduct[index].price}   ",
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: CustomColor.mainColor, fontSize: 16),
                        ),
                        Text("\$25 ",
                            style: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(
                                fontSize: 12,decoration: TextDecoration.lineThrough, color: CustomColor.productTextBlack.withOpacity(0.7))),
                        Text("50% off",
                            style: CustomTheme.lightTheme()
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 12,color: CustomColor.productTextBlack.withOpacity(0.7))),
                      ],
                    ),
                    trailing: index % 2 == 0
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: CustomColor.mainColor, width: 1),
                                color: CustomColor.secondaryColor,
                                borderRadius: BorderRadius.circular(24)),
                            child: Text(
                              "Payment confirmed",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(fontSize: 10, color: CustomColor.mainColor),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: CustomColor.mainColor, width: 1),
                                color: CustomColor.mainColor,
                                borderRadius: BorderRadius.circular(24)),
                            child: Text("Delivered",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontSize: 10, color: CustomColor.secondaryColor)),
                          ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
