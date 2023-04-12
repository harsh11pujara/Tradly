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

  @override
  Widget build(BuildContext context) {
    return storeDetails == null
        ? noStoreView()
        : hasStoreView();
  }

  Widget noStoreView(){
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

  Widget hasStoreView(){
    return Container(
      color: CustomColor.backgroundColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 235,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(            color: CustomColor.secondaryColor,
              boxShadow: [BoxShadow(color: Colors.black,spreadRadius: 1,blurRadius: 50,offset: Offset(0,-30))]
            ),
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
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 4),
                      decoration: BoxDecoration(border: Border.all(color: CustomColor.mainColor,width: 1),color: CustomColor.secondaryColor,borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "Edit Store",
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .labelSmall!
                            .copyWith(fontSize: 12, color: CustomColor.mainColor),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 4),
                      decoration: BoxDecoration(border: Border.all(color: CustomColor.mainColor,width: 1),color: CustomColor.mainColor,borderRadius: BorderRadius.circular(24)),
                      child: Text(
                          "View Store",
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .labelSmall!
                              .copyWith(fontSize: 12, color: CustomColor.secondaryColor)),
                    ),

                  ],
                ),
                const SizedBox(height: 23,),
                Divider(
                  color: CustomColor.customBlack.withOpacity(0.2),
                  height: 2,
                ),
                const SizedBox(height: 9,),
                Text(
                  "Remove Store",
                  style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: CustomColor.productTextBlack.withOpacity(0.5)),
                )
              ],
            ),
          ),
          const SizedBox(height: 59,),
          Text("You dont have product",style: CustomTheme.lightTheme().textTheme.displaySmall!.copyWith(color: Colors.black,fontSize: 18),),
          const SizedBox(height: 37,),
          GestureDetector(
            onTap: () async{
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateProduct(),)).then((value) {
                  setState(() {
                    products.add(value);
                  });
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
              decoration: BoxDecoration(border: Border.all(color: CustomColor.mainColor,width: 1.5),color: CustomColor.backgroundColor,borderRadius: BorderRadius.circular(34)),
              child: Text(
                "Add Product",
                style: CustomTheme.lightTheme()
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 18, color: CustomColor.mainColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


