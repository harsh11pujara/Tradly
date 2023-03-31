import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tradly/screens/authentication_screen/startUp_screens/startup_info.dart';
import 'package:tradly/utilities/themes.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const StartUpInfo(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/splash_box.svg"),
                Text("T",style: TextStyle(color: CustomColor.mainColor,fontSize: 20),)
              ],
            ),
            Text("Tradly", style: TextStyle(color: CustomColor.secondaryColor,fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
