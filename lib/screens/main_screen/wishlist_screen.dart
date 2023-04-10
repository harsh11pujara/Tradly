import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<ProductModel> wishlistProduct = [
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
          "Wishlist",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20,left: 18,right:18),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 220),
          itemCount: wishlistProduct.length,
          itemBuilder: (context, index) {
            return CustomWidgets().showProduct(context: context,product: wishlistProduct[index]);
          },
        ),
      ),
    );
  }
}
