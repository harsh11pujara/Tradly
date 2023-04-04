import 'package:flutter/material.dart';
import 'package:tradly/screens/home_screen/app_functions/browse/browse_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/history/history_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/home/home_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/profile/profile_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/store/store_screen.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    const HomeScreen(),
    const BrowseScreen(),
    const StoreScreen(),
    const HistoryScreen(),
    const ProfileScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_rounded),
              label: "Order History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }

  AppBar customAppbar() {
    List<String> pageName = [
      "Groceries",
      "Browse",
      "My Store",
      "Order History",
      "Profile"
    ];
    return AppBar(
      backgroundColor: CustomColor.mainColor,
      title: Column(
        children: [
          Row(
            children: [
              Text(pageName[currentIndex]),
              Expanded(
                child: Container(),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart))
            ],
          ),
          currentIndex == 0 || currentIndex == 1
              ? TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Products"),
                )
              : Container(),
          currentIndex == 1
              ? Row(
                  children: [
                    CustomWidgets()
                        .sortingWidget(icon: Icons.sort_sharp, text: "Sort by"),
                    CustomWidgets().sortingWidget(
                        icon: Icons.location_on, text: "Location"),
                    CustomWidgets()
                        .sortingWidget(icon: Icons.list, text: "Category")
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
