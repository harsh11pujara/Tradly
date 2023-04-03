import 'package:flutter/material.dart';
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
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text("Welcome to Tradly"),
            const SizedBox(
              height: 40,
            ),
            const Text("Login to your account"),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "Email/Mobile Number"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomWidgets().customSubmitButton(
                text: "Login",
                color: CustomColor.secondaryColor,
                textColor: CustomColor.mainColor),
            const SizedBox(
              height: 10,
            ),
            const Text("Forgot your Password ? "),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text("Don't have an account ? "),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
