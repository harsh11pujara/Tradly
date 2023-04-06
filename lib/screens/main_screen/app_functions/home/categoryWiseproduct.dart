import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  List<ProductModel> newProduct = [
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Shampoo", img: "assets/images/products/shampoo.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Soap", img: "assets/images/products/soap.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/chips.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpg", traderName: "Tradly", price: "25"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title,style: CustomTheme.lightTheme().textTheme.labelLarge,),centerTitle: true,backgroundColor: CustomColor.mainColor),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CustomWidgets().showProduct(product: newProduct[index]);
        },
      ),
    );
  }
}
