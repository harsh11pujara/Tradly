import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/models/store_model.dart';
import 'package:tradly/screens/main_screen/app_functions/store/create_product.dart';
import 'package:tradly/screens/main_screen/app_functions/store/create_store.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  StoreModel? storeDetails;
  List<ProductModel> products = [];
  List<Widget> noProductWidgets = [];
  List<Widget> hasProductView = [];
  List<ProductModel> newProduct = [
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Shampoo", img: "assets/images/products/shampoo.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Soap", img: "assets/images/products/soap.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/chips.jpg", traderName: "Tradly", price: "25"),
  ];

  @override
  Widget build(BuildContext context) {
    /// WHEN THERE ARE NO PRODUCT, THIS BOTTOM CONTENT WILL BE SHOWN
    noProductWidgets = [
      const SizedBox(
        height: 59,
      ),
      Text(
        "You dont have product",
        style: CustomTheme.lightTheme().textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 18),
      ),
      const SizedBox(
        height: 37,
      ),
      GestureDetector(
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateProduct(),
              )).then((value) {
            setState(() {
              print(value.toString());
              products.add(value);
            });
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(color: CustomColor.mainColor, width: 1.5),
              color: CustomColor.backgroundColor,
              borderRadius: BorderRadius.circular(34)),
          child: Text(
            "Add Product",
            style: CustomTheme.lightTheme().textTheme.displaySmall!.copyWith(fontSize: 18, color: CustomColor.mainColor),
          ),
        ),
      ),
    ].toList();

    hasProductView = [
      SizedBox(
        height: 31,
      ),
      TextField(
        style: CustomTheme.lightTheme()
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 18, color: CustomColor.productTextBlack.withOpacity(0.5)),
        textCapitalization: TextCapitalization.words,
        cursorColor: CustomColor.mainColor,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: CustomColor.secondaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: CustomColor.secondaryColor)),
            // border: ),
            prefixIcon: SvgPicture.asset(
              "assets/icons/searchIcon.svg",
              height: 34,
              width: 34,
              fit: BoxFit.scaleDown,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 65, minHeight: 60),
            hintText: "Search Products",
            filled: true,
            fillColor: CustomColor.secondaryColor),
      ),
      SizedBox(
        height: 27,
      ),
      Text(
        "Products",
        style: CustomTheme.lightTheme().textTheme.headlineMedium,
      ),
      SizedBox(
        height: 16,
      ),
      GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 220),
        itemCount: newProduct.length + 1,
        itemBuilder: (context, index) {
          return index == 0
              ? GestureDetector(
            onTap: () async{
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateProduct(),
                  )).then((value) {
                setState(() {
                  products.add(value);
                });
              });
            },
                child: DottedBorder(
                    radius: const Radius.circular(10),
                    color: CustomColor.productTextBlack.withOpacity(0.3),
                    borderType: BorderType.RRect,
                    dashPattern: [6, 3],
                    strokeWidth: 1.5,
                    child: SizedBox(
                      height: 220, // 220
                      width: double.infinity, //180
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: CustomColor.productTextBlack.withOpacity(0.4),
                            size: 40,
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Add Product",
                            style: CustomTheme.lightTheme()
                                .textTheme
                                .labelSmall!
                                .copyWith(fontSize: 18, color: CustomColor.customBlack.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                  ),
              )
              : Stack(
                  children: [
                    CustomWidgets().showProduct(width: null, context: context, product: newProduct[index - 1]),
                    Container(
                      height: 220,
                      width: null,
                      // color: Colors.redAccent,
                      padding: EdgeInsets.only(bottom: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton.small(
                            heroTag: "edit btn${index - 1}",
                            elevation: 0.5,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateProduct(isEditing: true),
                                  ));
                            },
                            backgroundColor: CustomColor.secondaryColor.withOpacity(0.1),
                            child: const Icon(Icons.edit),
                          ),
                          FloatingActionButton.small(
                            heroTag: "delete btn${index - 1}",
                            elevation: 0.5,
                            onPressed: () {
                              setState(() {
                                newProduct.removeAt(index - 1);
                              });
                            },
                            backgroundColor: CustomColor.secondaryColor.withOpacity(0.1),
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    )
                  ],
                );
        },
      ),
      SizedBox(
        height: 15,
      )
    ].toList();

    /// Widget Tree
    return storeDetails == null ? noStoreView() : hasStoreView();
  }

  Widget noStoreView() {
    return Container(
      color: CustomColor.backgroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 58,
          ),
          SvgPicture.asset("assets/images/emptyStorePic.svg"),
          const SizedBox(
            height: 28,
          ),
          Text(
            "You Don't Have a Store",
            style: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(color: Colors.black, fontSize: 18),
          ),
          const SizedBox(
            height: 37,
          ),
          GestureDetector(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateStore(),
                  )).then((value) {
                setState(() {
                  print("got value$value");
                  storeDetails = value;
                });
              });
            },
            child: CustomWidgets().sortingWidget(
              text: "Create Store",
              paddingH: 60,
              paddingV: 15,
              backgroundColor: CustomColor.mainColor,
              textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Widget hasStoreView() {
    return Container(
      color: CustomColor.backgroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 235,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: CustomColor.secondaryColor,
                  boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1, blurRadius: 50, offset: Offset(0, -30))]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CircleAvatar(
                    backgroundColor: CustomColor.mainColor,
                    radius: 24,
                    child: Text(
                      "T",
                      style: TextStyle(color: CustomColor.secondaryColor, fontSize: 34, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Tradly Store",
                    style: CustomTheme.lightTheme().textTheme.titleLarge!.copyWith(color: CustomColor.customBlack),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: CustomColor.mainColor, width: 1),
                            color: CustomColor.secondaryColor,
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          "Edit Store",
                          style:
                              CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(fontSize: 12, color: CustomColor.mainColor),
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: CustomColor.mainColor, width: 1),
                            color: CustomColor.mainColor,
                            borderRadius: BorderRadius.circular(24)),
                        child: Text("View Store",
                            style: CustomTheme.lightTheme()
                                .textTheme
                                .labelSmall!
                                .copyWith(fontSize: 12, color: CustomColor.secondaryColor)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Divider(
                    color: CustomColor.customBlack.withOpacity(0.2),
                    height: 2,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Remove Store",
                    style: CustomTheme.lightTheme()
                        .textTheme
                        .labelSmall!
                        .copyWith(color: CustomColor.productTextBlack.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: products.isEmpty ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  ...products.isEmpty ? noProductWidgets : hasProductView,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
