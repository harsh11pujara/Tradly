import 'package:flutter/material.dart';
import 'package:tradly/screens/home_screen/app_functions/browse/browse_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/history/history_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/home/home_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/profile/profile_screen.dart';
import 'package:tradly/screens/home_screen/app_functions/store/store_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [HomeScreen(),BrowseScreen(),StoreScreen(),HistoryScreen(),ProfileScreen()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Browse"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "Store"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_rounded),
              label: "Order History"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          ),
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
}
