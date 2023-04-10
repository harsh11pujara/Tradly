import 'package:flutter/material.dart';
import 'package:tradly/models/address_model.dart';
import 'package:tradly/screens/main_screen/cart/cart_screen.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class CreateAddress extends StatefulWidget {
  const CreateAddress({Key? key}) : super(key: key);

  @override
  State<CreateAddress> createState() => _CreateAddressState();
}

class _CreateAddressState extends State<CreateAddress> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add a new address",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAddress(),
                          ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 65,
                      decoration: const BoxDecoration(
                          color: CustomColor.secondaryColor,
                          boxShadow: [BoxShadow(blurRadius: 30, spreadRadius: 0.5, offset: Offset(0, -30))]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.my_location_sharp, color: Color(0xFF4EA0FF)),
                          Text(
                            " Use Current Location",
                            style: CustomTheme.lightTheme().textTheme.titleSmall!.copyWith(color: const Color(0xFF4EA0FF)),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: name,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "Name",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        TextFormField(
                          controller: phone,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "Phone",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        TextFormField(
                          controller: street,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "Street Address",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        TextFormField(
                          controller: city,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "City",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        TextFormField(
                          controller: state,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "State",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        TextFormField(
                          controller: zip,
                          textCapitalization: TextCapitalization.words,
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                          cursorColor: const Color(0xFFDBDBDE),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              enabledBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              focusedBorder:
                                  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                              label: Text(
                                "Zipcode",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        const SizedBox(height: 100,)
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
                decoration: const BoxDecoration(
                    color: CustomColor.secondaryColor,
                    boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 5, blurRadius: 20, offset: Offset(0, 15))]),
                child: GestureDetector(
                  onTap: () {
                    AddressModel address = AddressModel(name.text.trim(), phone.text.trim(), street.text.trim(), city.text.trim(), state.text.trim(),
                        zip.text.trim());
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartScreen(address: address),));
                  },
                  child: CustomWidgets().sortingWidget(
                      text: "Save",
                      backgroundColor: CustomColor.mainColor,
                      // paddingH: 100,
                      paddingV: 15,
                      textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 18)),
                ),
              ))
        ],
      ),
    );
  }
}
