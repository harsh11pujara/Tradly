import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  List<ProductModel> newProduct = [
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Shampoo", img: "assets/images/products/shampoo.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Soap", img: "assets/images/products/soap.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/chips.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/coffee.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/fruits.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/eggs.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Shampoo", img: "assets/images/products/shampoo.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Soap", img: "assets/images/products/soap.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/chips.jpg", traderName: "Tradly", price: "25"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            style: CustomTheme.lightTheme().textTheme.labelLarge,
          ),
          centerTitle: true,
          backgroundColor: CustomColor.mainColor,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidgets().sortingWidget(
                      paddingH: 12,
                      icon: Icons.sort_sharp,
                      text: "Sort by",
                      backgroundColor: CustomColor.mainColor,
                      textStyle: CustomTheme.lightTheme().textTheme.titleSmall),
                  CustomWidgets().sortingWidget(
                    paddingH: 12,
                      icon: Icons.location_on,
                      text: "Location",
                      backgroundColor: CustomColor.mainColor,
                      textStyle: CustomTheme.lightTheme().textTheme.titleSmall),
                  CustomWidgets().sortingWidget(
                      paddingH: 12,
                      icon: Icons.list,
                      text: "Category",
                      backgroundColor: CustomColor.mainColor,
                      textStyle: CustomTheme.lightTheme().textTheme.titleSmall)
                ],
              ),
            ),
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 220),
          itemCount: newProduct.length,
          itemBuilder: (context, index) {
            return CustomWidgets().showProduct(product: newProduct[index]);
          },
        ),
      ),
    );
  }
}
