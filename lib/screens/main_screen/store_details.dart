import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({Key? key}) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  bool isSearching = false;
  List<ProductModel> newProduct = [
    ProductModel(name: "CocaCola", img: "assets/images/products/cocaCola.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Cookies", img: "assets/images/products/cookies.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Milk", img: "assets/images/products/milk.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Shampoo", img: "assets/images/products/shampoo.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Soap", img: "assets/images/products/soap.jpeg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/chips.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/products/coffee.jpg", traderName: "Tradly", price: "25"),
    ProductModel(name: "Chips", img: "assets/images/fruits.jpeg", traderName: "Tradly", price: "25"),
  ];

  List<String> categoryList = ["All product", "Fruit", "Vegetables","Home Care", "Pet Care"];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: isSearching == false ? AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Tradly Store",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 90,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
              icon: const Icon(
                Icons.search_sharp,
                size: 30,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      ) : AppBar(
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        title: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          style: CustomTheme.lightTheme()
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 16),
          cursorColor: const Color(0xFFDBDBDE),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            prefixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isSearching = false;
                });
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_sharp,color: Colors.white,),
                  Expanded(child: Container())
                ],
              ),
            ),
              prefixIconConstraints: const BoxConstraints(maxWidth: 50),
              suffixIcon: const Icon(Icons.search_sharp,color: CustomColor.secondaryColor,),
              enabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 1)),
              focusedBorder:
              const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 1)),
              hintText: "Search Product",
              hintStyle: CustomTheme.lightTheme()
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 16),
              ),
        ),

        bottom: PreferredSize(preferredSize: const Size(double.infinity,70),child: Container(
          padding: const EdgeInsets.only(bottom: 18,top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomWidgets().sortingWidget(
                  paddingH: 10,
                  icon: Icons.sort_sharp,
                  text: "Sort by",
                  backgroundColor: CustomColor.mainColor,
                  textStyle: CustomTheme.lightTheme().textTheme.titleSmall),
              CustomWidgets().sortingWidget(
                  paddingH: 10,
                  icon: Icons.location_on,
                  text: "Location",
                  backgroundColor: CustomColor.mainColor,
                  textStyle: CustomTheme.lightTheme().textTheme.titleSmall),
              CustomWidgets().sortingWidget(
                  paddingH: 10,
                  icon: Icons.list,
                  text: "Category",
                  backgroundColor: CustomColor.mainColor,
                  textStyle: CustomTheme.lightTheme().textTheme.titleSmall)
            ],
          ),
        )),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: isSearching == true ?  Container(padding: const EdgeInsets.only(left: 20,right: 20,top: 20),child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 220),
          itemCount: newProduct.length,
          itemBuilder: (context, index) {
            return CustomWidgets().showProduct(context: context,product: newProduct[index]);
          },
        ),) :SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 20,
                    color: CustomColor.mainColor,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 45, top: 22, right: 40, bottom: 35),
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: CustomColor.secondaryColor),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: CustomColor.mainColor,
                              radius: 24,
                              child: Text(
                                "T",
                                style: TextStyle(color: CustomColor.secondaryColor, fontSize: 28, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tradly Store",
                                  style: CustomTheme.lightTheme()
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 14, color: CustomColor.customBlack),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "tradly.app",
                                  style: CustomTheme.lightTheme()
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 12, color: CustomColor.customBlack.withOpacity(0.5)),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const StoreDetails(),
                                    ));
                              },
                              child: CustomWidgets().sortingWidget(
                                  text: "Follow",
                                  paddingH: 23,
                                  backgroundColor: CustomColor.mainColor,
                                  textStyle: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(fontSize: 12)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In augue nunc vel rhoncus, sed. Neque hendrerit risus ut metus ultrices ac. Dui morbi eu amet id mauris. Eget at ut.",
                            softWrap: true,
                            style: CustomTheme.lightTheme()
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 12, color: CustomColor.customBlack.withOpacity(0.7))),
                        const SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                              decoration: BoxDecoration(
                                color: CustomColor.taglineColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Groceries",
                                    style: CustomTheme.lightTheme()
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: CustomColor.productTextBlack),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.close,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                              decoration: BoxDecoration(
                                color: CustomColor.taglineColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Vegetables",
                                    style: CustomTheme.lightTheme()
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: CustomColor.productTextBlack),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.close,
                                    size: 15,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: 88,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: CustomColor.secondaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Total Followers",
                          style: CustomTheme.lightTheme().textTheme.labelSmall,
                        ),
                        Text("0", style: CustomTheme.lightTheme().textTheme.labelSmall)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total Products", style: CustomTheme.lightTheme().textTheme.labelSmall),
                        Text("0", style: CustomTheme.lightTheme().textTheme.labelSmall)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // ListView.builder(itemBuilder: (context, index) {
              //   return GestureDetector(
              //     onTap: () {
              //       selected = index;
              //     },
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              //       decoration: BoxDecoration(
              //           border: Border.all(color: CustomColor.mainColor, width: 1),
              //           color: CustomColor.mainColor,
              //           borderRadius: BorderRadius.circular(24)),
              //       child: Text(
              //         categoryList[index],
              //         style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: CustomColor.secondaryColor),
              //       ),
              //     ),
              //   );
              // },),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.mainColor, width: 1),
                          color: CustomColor.mainColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "All Product",
                        style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: CustomColor.secondaryColor),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.customBlack.withOpacity(0.4), width: 1),
                          color: CustomColor.backgroundColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "Fruit",
                        style: CustomTheme.lightTheme().textTheme.labelSmall,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.customBlack.withOpacity(0.4), width: 1),
                          color: CustomColor.backgroundColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "Vegetables",
                        style: CustomTheme.lightTheme().textTheme.labelSmall,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.customBlack.withOpacity(0.4), width: 1),
                          color: CustomColor.backgroundColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "Home Care",
                        style: CustomTheme.lightTheme().textTheme.labelSmall,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.customBlack.withOpacity(0.4), width: 1),
                          color: CustomColor.backgroundColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "Pet Care",
                        style: CustomTheme.lightTheme().textTheme.labelSmall,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 220),
                  itemCount: newProduct.length,
                  itemBuilder: (context, index) {
                    return CustomWidgets().showProduct(context: context, product: newProduct[index]);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
