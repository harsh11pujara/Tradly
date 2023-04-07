import 'package:flutter/material.dart';
import 'package:tradly/models/category_model.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/models/store_model.dart';
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
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Shampoo", img: "assets/images/products/shampoo.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Soap", img: "assets/images/products/soap.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/chips.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/coffee.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/fruits.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/eggs.jpeg", traderName: "Tradly", price: "25"),
  ];

  List<CategoryModel> categoryTypes = [
    CategoryModel(img: "assets/images/bakery.jpeg", title: "Bakery"),
    CategoryModel(img: "assets/images/beverages.jpeg", title: "Beverage"),
    CategoryModel(img: "assets/images/eggs.jpeg", title: "Eggs"),
    CategoryModel(img: "assets/images/frozenVeg.jpeg", title: "Frozen Veg"),
    CategoryModel(img: "assets/images/fruits.jpeg", title: "Fruits"),
    CategoryModel(img: "assets/images/homeCare.jpeg", title: "Home Care"),
    CategoryModel(img: "assets/images/petCare.jpeg", title: "Pet Care"),
    CategoryModel(img: "assets/images/vegetables.jpeg", title: "Vegetables"),
  ];
  
  List<StoreModel> storeList = [
    StoreModel(img: "assets/images/store/store1.jpeg", name: "Tradly"),
    StoreModel(img: "assets/images/store/store2.jpeg", name: "Groceries Store"),
    StoreModel(img: "assets/images/store/store3.jpeg", name: "Cake Shop"),
    StoreModel(img: "assets/images/store/store4.jpeg", name: "Shoe Store"),
    StoreModel(img: "assets/images/store/store5.jpeg", name: "Icecream Shop"),
    StoreModel(img: "assets/images/store/store6.jpeg", name: "Garment Shop"),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: width,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                              "assets/images/vegetableMarket.jpeg",
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
                              "assets/images/vegetableMarket.jpeg",
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
                physics: const NeverScrollableScrollPhysics(),
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
              height: 220,
              width: width,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 6),

                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: newProduct.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),

                      child: CustomWidgets().showProduct(context: context,product: newProduct[index]));
                },
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Product",
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
              height: 220,
              width: width,
              child: ListView.builder(
padding: const EdgeInsets.symmetric(horizontal: 6),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,

                itemCount: newProduct.length,
                itemBuilder: (context, index) {
                  newProduct.shuffle();
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),

                  child: CustomWidgets().showProduct(context: context,product: newProduct[index]));
                },
              ),
            ),
            const SizedBox(height: 30,),
            Stack(children: [
              Container(height: 184,width: double.infinity,color: CustomColor.mainColor,),
              Column(children: [
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Store to Follow",
                        style: CustomTheme.lightTheme().textTheme.headlineMedium!.copyWith(color: CustomColor.secondaryColor),
                      ),
                      CustomWidgets().sortingWidget(
                          paddingH: 23,
                          text: "See All",
                          backgroundColor: CustomColor.secondaryColor,
                          textStyle: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(color: CustomColor.mainColor))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 210,
                  width: width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: storeList.length,
                    itemBuilder: (context, index) {
                      storeList.shuffle();
                      return CustomWidgets().storeFollowWidget(storeList[index]);
                    },
                  ),
                ),
                const SizedBox(height: 10,)
              ],)
            ],)
          ],
        ),
      ),
    );
  }


}
