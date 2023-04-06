import 'package:flutter/material.dart';
import 'package:tradly/models/category_model.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/screens/main_screen/app_functions/home/categoryWiseproduct.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> newProduct = [
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Shampoo", img: "assets/images/products/shampoo.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Soap", img: "assets/images/products/soap.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/chips.jpg", traderName: "Tradly", price: "25"),
  ];

  List<CategoryModel> categoryTypes = [
    CategoryModel(img: "assets/images/bakery.jpg", title: "Bakery"),
    CategoryModel(img: "assets/images/beverage.jpg", title: "Beverage"),
    CategoryModel(img: "assets/images/eggs.jpg", title: "Eggs"),
    CategoryModel(img: "assets/images/frozenVeg.jpg", title: "Frozen Veg"),
    CategoryModel(img: "assets/images/fruits.jpg", title: "Fruits"),
    CategoryModel(img: "assets/images/homeCare.jpg", title: "Home Care"),
    CategoryModel(img: "assets/images/petCare.jpg", title: "Pet Care"),
    CategoryModel(img: "assets/images/vegetables.jpg", title: "Vegetables"),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          width: 302,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/images/vegetableMarket.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          height: 180,
                          width: 302,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black.withOpacity(0.4)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ready to deliver to your home",
                                  style: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 22), softWrap: true),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: CustomWidgets().sortingWidget(
                                  textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 16),
                                  text: "Start Shopping",
                                  backgroundColor: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          width: 302,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/images/vegetableMarket.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          height: 180,
                          width: 302,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ready to deliver to your home",
                                  style: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 22), softWrap: true),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: CustomWidgets().sortingWidget(
                                  textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 16),
                                  text: "Start Shopping",
                                  backgroundColor: Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 200,
              width: width,
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 1, crossAxisSpacing: 1),
                itemCount: categoryTypes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductCategory(title: categoryTypes[index].title),
                          ));
                    },
                    child: CustomWidgets().productCategory(
                        img: categoryTypes[index].img,
                        title: categoryTypes[index].title,
                        width: MediaQuery.of(context).size.width / 4),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Product",
                    style: CustomTheme.lightTheme().textTheme.headlineMedium,
                  ),
                  CustomWidgets().sortingWidget(
                      paddingH: 23,
                      text: "See All",
                      backgroundColor: CustomColor.mainColor,
                      textStyle: CustomTheme.lightTheme().textTheme.titleSmall)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newProduct.length,
                itemBuilder: (context, index) {
                  return CustomWidgets().showProduct(product: newProduct[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
