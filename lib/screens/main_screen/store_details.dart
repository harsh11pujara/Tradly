import 'package:flutter/material.dart';
import 'package:tradly/models/store_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({Key? key}) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Tradly Store",
          style: CustomTheme
              .lightTheme()
              .textTheme
              .labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 90,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_sharp,
                size: 30,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
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
                                style: CustomTheme
                                    .lightTheme()
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontSize: 14, color: CustomColor.customBlack),
                              ),
                              const SizedBox(height: 3,),
                              Text(
                                "tradly.app",
                                style: CustomTheme
                                    .lightTheme()
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
                                textStyle: CustomTheme
                                    .lightTheme()
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontSize: 12)),
                          )
                        ],
                      ),
                      SizedBox(height: 25,),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In augue nunc vel rhoncus, sed. Neque hendrerit risus ut metus ultrices ac. Dui morbi eu amet id mauris. Eget at ut.",
                        softWrap: true,
                        style:CustomTheme
                            .lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 12, color: CustomColor.customBlack.withOpacity(0.7))),
                      SizedBox(height: 21,),

                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
