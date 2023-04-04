import 'package:flutter/material.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/images/vegetableMarket.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(40)),
                    child: Column(
                      children: [
                        const Text("Ready to deliver to your home"),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: CustomWidgets()
                              .sortingWidget(text: "Start Shopping"),
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
                    height: 120,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/images/vegetableMarket.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(40)),
                    child: Column(
                      children: [
                        const Text("Ready to deliver to your home"),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: CustomWidgets()
                              .sortingWidget(text: "Start Shopping"),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          GridView.count(
            padding: const EdgeInsets.all(2),
            crossAxisCount: 4,
            children: [
              CustomWidgets().productCategory(
                  img: "assets/images/bakery.jpg", title: "Bakery"),
              CustomWidgets().productCategory(
                  img: "assets/images/beverage.jpg", title: "Beverage"),
              CustomWidgets().productCategory(
                  img: "assets/images/eggs.jpg", title: "Eggs"),
              CustomWidgets().productCategory(
                  img: "assets/images/frozenVeg.jpg", title: "Frozen Veg"),
              CustomWidgets().productCategory(
                  img: "assets/images/fruits.jpg", title: "Fruits"),
              CustomWidgets().productCategory(
                  img: "assets/images/homeCare.jpg", title: "Home Care"),
              CustomWidgets().productCategory(
                  img: "assets/images/petCare.jpg", title: "Pet Care"),
              CustomWidgets().productCategory(
                  img: "assets/images/vegetables.jpg", title: "Vegetables"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("New Product"),
              CustomWidgets().sortingWidget(
                  text: "See All", backgroundColor: CustomColor.mainColor)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container();
            },
          )
        ],
      ),
    );
  }
}
