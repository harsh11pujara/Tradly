import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      body: Column(
        children: [
          const SizedBox(height: 50,),
          const Text("Phone Verification"),
          const SizedBox(height: 15,),
          const Text("Enter your OTP code here"),
          const SizedBox(height: 40,),
          const OTPTextField(length: 6,width: 200,style: TextStyle(fontSize: 18),),
          const SizedBox(height: 40,),
          const Text("Didn't you received any code? "),
          const SizedBox(height: 5,),
          const Text("Resent new code"),
          const SizedBox(height: 20,),
          CustomWidgets().customSubmitButton(text: "Verify", color: CustomColor.secondaryColor, textColor: CustomColor.mainColor)
        ],
      ),
    );
  }
}
