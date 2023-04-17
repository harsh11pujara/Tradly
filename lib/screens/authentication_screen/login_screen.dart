import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tradly/screens/authentication_screen/signup_screen.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Text(
                  "Welcome to Tradly",
                  style: CustomTheme.lightTheme().textTheme.bodyMedium!.copyWith(fontSize: 24, color: CustomColor.secondaryColor),
                ),
                const SizedBox(
                  height: 66,
                ),
                Text(
                  "Login to your account",
                  style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomWidgets().authTextField(hintText: "Email/Mobile Number", textCapital: TextCapitalization.words),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height: 60,
                    child: CustomWidgets().authTextField(
                      hintText: "Password",
                    )),
                const SizedBox(
                  height: 32,
                ),
                CustomWidgets()
                    .customSubmitButton(text: "Login", color: CustomColor.secondaryColor, textColor: CustomColor.authButtonColor),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Forgot your Password ? ",
                  style: CustomTheme.lightTheme().textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 35,
                ),
                RichText(
                  text: TextSpan(
                      text: "Don't have an account ?  ",
                      style: CustomTheme.lightTheme().textTheme.labelMedium,
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              print("tap");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpScreen(),
                                    ));
                              },
                            text: "Sign Up",
                            style: CustomTheme.lightTheme()
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 20, fontWeight: FontWeight.w700))
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
