import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:tradly/screens/main_screen/app_navigator_screen.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                "Phone Verification",
                style: CustomTheme.lightTheme().textTheme.bodyMedium!.copyWith(fontSize: 24, color: CustomColor.secondaryColor),
              ),
              const SizedBox(
                height: 25,
              ),
              Text("Enter your OTP code here",
                style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 70,
              ),
              OTPTextField(
                length: 6,
                width: 250,
                style: CustomTheme.lightTheme().textTheme.labelLarge!,
                otpFieldStyle: OtpFieldStyle(focusBorderColor: CustomColor.secondaryColor,enabledBorderColor:CustomColor.secondaryColor),
              ),
              const SizedBox(
                height: 40,
              ),
               Text("Didn't you received any code? ",style: CustomTheme.lightTheme().textTheme.labelMedium),
              const SizedBox(
                height: 8,
              ),
               Text("Resent new code",style: CustomTheme.lightTheme().textTheme.labelMedium),
              const SizedBox(
                height: 72,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NavigatorScreen()), (route) => false);

                },
                child: CustomWidgets()
                    .customSubmitButton(text: "Verify", color: CustomColor.secondaryColor, textColor: CustomColor.mainColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
