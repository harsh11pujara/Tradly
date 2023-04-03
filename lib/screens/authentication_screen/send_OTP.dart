import 'package:flutter/material.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class SendOTP extends StatefulWidget {
  const SendOTP({Key? key}) : super(key: key);

  @override
  State<SendOTP> createState() => _SendOTPState();
}

class _SendOTPState extends State<SendOTP> {
  List<int> dropDownItem = [91, 81, 92,93, 94,95];
  int selectedItem = 91;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      body: Column(
        children: [const SizedBox(height: 50,),
          const Text("Verify your phone number"),
          const SizedBox(height: 20,),
          const Text("We have sent you an SMS with a code to enter number"),
          const SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              prefixIcon: DropdownButton(value: "+ $selectedItem",icon: const Icon(Icons.arrow_drop_down_sharp),items: dropDownItem.map((int item) {
                return DropdownMenuItem(child: Text("+ $item"));
              }).toList(),onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
              },),hintText: "0123456789"
            ),
          ),
          const SizedBox(height: 15,),
          const Text("Or login with Social network"),
          const SizedBox(height: 5,),
          GestureDetector(onTap: (){},child: CustomWidgets().customSubmitButton(text: "Next", color: CustomColor.secondaryColor, textColor: CustomColor.mainColor))
        ],
      ),
    );
  }
}
