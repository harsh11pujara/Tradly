import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradly/screens/main_screen/app_functions/browse/browse_screen.dart';
import 'package:tradly/screens/main_screen/app_functions/history/history_screen.dart';
import 'package:tradly/screens/main_screen/app_functions/home/home_screen.dart';
import 'package:tradly/screens/main_screen/app_functions/profile/profile_screen.dart';
import 'package:tradly/screens/main_screen/app_functions/store/store_screen.dart';
import 'package:tradly/screens/main_screen/cart/cart_screen.dart';
import 'package:tradly/screens/main_screen/wishlist_screen.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
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
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CustomColor.mainColor,
        iconSize: 24,
        unselectedLabelStyle: GoogleFonts.montserrat(
          color: CustomColor.customBlack,
          fontSize: 10,
        ),
        showUnselectedLabels: true,
        selectedLabelStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.featured_play_list_rounded), label: "Order History"),
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
    List<String> pageName = ["Groceries", "Browse", "My Store", "Order History", "Profile"];
    return AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: CustomColor.mainColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(height: 0,),
            Row(
              children: [
                Text(
                  pageName[currentIndex],
                  style: CustomTheme.lightTheme().textTheme.titleLarge,
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WishlistScreen(),
                          ));
                    },
                    icon: const Icon(Icons.favorite)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ));
                    },
                    icon: const Icon(Icons.shopping_cart))
              ],
            ),
          ],
        ),
        bottom: currentIndex == 0 || currentIndex == 1
            ? PreferredSize(
                preferredSize: currentIndex == 1 ? const Size(double.infinity, 140) : const Size(double.infinity, 80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextField(
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 18, color: CustomColor.productTextBlack.withOpacity(0.5)),
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: CustomColor.secondaryColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: CustomColor.secondaryColor)),
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
                    ),
                    currentIndex == 1
                        ? const SizedBox(
                            height: 28,
                          )
                        : Container(),
                    currentIndex == 1
                        ? Row(
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
                          )
                        : Container(),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ))
            : null);
  }
}
