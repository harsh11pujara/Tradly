import 'package:flutter/material.dart';
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
      backgroundColor: CustomColor.mainColor,
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text("Welcome to Tradly"),
            const SizedBox(
              height: 30,
            ),
            const Text("Signup to your account"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "First Name"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Last Name"),
            ),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "Email Id/Phone Number"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Re-enter Password"),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomWidgets().customSubmitButton(
                text: "Create",
                color: CustomColor.secondaryColor,
                textColor: CustomColor.mainColor),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text("Have an account ? "),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign In",
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
