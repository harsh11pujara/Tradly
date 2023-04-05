import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradly/screens/authentication_screen/OTP_verification.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class SendOTP extends StatefulWidget {
  const SendOTP({Key? key}) : super(key: key);

  @override
  State<SendOTP> createState() => _SendOTPState();
}

class _SendOTPState extends State<SendOTP> {
  List<int> dropDownItem = [91, 81, 92, 93, 94, 95];
  int selectedItem = 91;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: CustomColor.mainColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                "Verify your phone number",
                style: CustomTheme.lightTheme().textTheme.bodyMedium!.copyWith(fontSize: 24, color: CustomColor.secondaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 29,
              ),
              Text(
                "We have sent you an SMS with a code to enter number",
                style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                  style: GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w400, fontSize: 18),
                  cursorColor: CustomColor.secondaryColor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: DropdownButton<String>(
                          value: "+ $selectedItem",
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          items: dropDownItem.map((int item) {
                            return DropdownMenuItem(value: "+ $item", child: Text("+$item"));
                          }).toList(),
                          onChanged: (value) {
                            print(value!.split("+").last);
                            setState(() {
                              selectedItem = int.parse(value.split("+").last);
                            });
                          },
                          style:
                              GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w400, fontSize: 18),
                          iconEnabledColor: CustomColor.secondaryColor,
                          // focusColor: ,
                          dropdownColor: CustomColor.mainColor,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid)),
                      hintText: "9876543210",
                      hintStyle:
                          GoogleFonts.montserrat(color: CustomColor.secondaryColor, fontWeight: FontWeight.w400, fontSize: 18))),
              const SizedBox(
                height: 64,
              ),
              Text(
                "Or login with Social network",
                style: CustomTheme.lightTheme().textTheme.labelMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPVerification(),));

                  },
                  child: CustomWidgets()
                      .customSubmitButton(text: "Next", color: CustomColor.secondaryColor, textColor: CustomColor.mainColor))
            ],
          ),
        ),
      ),
    );
  }
}
