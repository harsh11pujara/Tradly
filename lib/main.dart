import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradly/screens/authentication_screen/startup_info.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/screens/main_screen/app_navigator_screen.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
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
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const StartUpInfo()));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigatorScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: CustomColor.mainColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: CustomColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SvgPicture.asset("assets/images/splash_box.svg"),
                Positioned(left: 38, top: 20, child: SvgPicture.asset("assets/images/splashT.svg"))
              ],
            ),
            Text(
              "Tradly",
              style: CustomTheme.lightTheme().textTheme.bodyMedium!.copyWith(fontSize: 30, color: CustomColor.secondaryColor),
            )
          ],
        ),
      ),
    );
  }
}
