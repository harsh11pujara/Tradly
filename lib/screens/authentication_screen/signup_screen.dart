import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tradly/screens/authentication_screen/send_OTP.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: CustomColor.mainColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome to Tradly",
                  style: CustomTheme.lightTheme().textTheme.bodyMedium!.copyWith(fontSize: 24, color: CustomColor.secondaryColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Signup to your account",
                  style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomWidgets().authTextField(hintText: "First Name"),
                const SizedBox(
                  height: 16,
                ),
                CustomWidgets().authTextField(hintText: "Last Name"),
                const SizedBox(
                  height: 16,
                ),
                CustomWidgets().authTextField(hintText: "Email Id/Phone Number"),
                const SizedBox(
                  height: 16,
                ),
                CustomWidgets().authTextField(hintText: "Password"),
                const SizedBox(
                  height: 16,
                ),
                CustomWidgets().authTextField(hintText: "Re-enter Password"),
                const SizedBox(
                  height: 46,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SendOTP(),
                        ));
                  },
                  child: CustomWidgets().customSubmitButton(
                      text: "Create", color: CustomColor.secondaryColor, textColor: CustomColor.authButtonColor),
                ),
                const SizedBox(
                  height: 22,
                ),
                RichText(
                    text: TextSpan(text: "Have an account ? ", style: CustomTheme.lightTheme().textTheme.labelMedium, children: [
                  TextSpan(
                      text: "Sign In",
                      style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        })
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
