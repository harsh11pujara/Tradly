import 'package:flutter/material.dart';
import 'package:tradly/utilities/themes.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({Key? key}) : super(key: key);

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Option",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
    );
  }
}
