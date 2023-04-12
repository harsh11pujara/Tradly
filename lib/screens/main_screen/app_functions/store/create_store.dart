import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradly/models/store_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class CreateStore extends StatefulWidget {
  const CreateStore({Key? key}) : super(key: key);

  @override
  State<CreateStore> createState() => _CreateStoreState();
}

class _CreateStoreState extends State<CreateStore> {
  TextEditingController name = TextEditingController();
  TextEditingController webAddress = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController storetype = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController courier = TextEditingController();
  TextEditingController tagline = TextEditingController();

  bool taglineInput = false;
  List<String> taglineList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "My Store",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 90,
      ),
      backgroundColor: CustomColor.backgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 23,
                  ),
                  SvgPicture.asset("assets/images/emptyStorePic.svg"),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: Text(
                      "This information is used to set up your shop",
                      style: CustomTheme.lightTheme().textTheme.labelSmall,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    color: CustomColor.secondaryColor,
                    child: Column(children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            focusedBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            label: Text(
                              "Store Name",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                            )),
                      ),
                      TextFormField(
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                            enabledBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            focusedBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            label: Text(
                              "Store Web Address",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                            )),
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            focusedBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            label: Text(
                              "Store Description",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                            )),
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            focusedBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            label: Text(
                              "Store Type",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                            )),
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            focusedBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            label: Text(
                              "Address",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                            )),
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
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
                        textCapitalization: TextCapitalization.words,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
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
                        textCapitalization: TextCapitalization.words,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            focusedBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            label: Text(
                              "Country",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                            )),
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        style: CustomTheme.lightTheme()
                            .textTheme
                            .titleSmall!
                            .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                        cursorColor: const Color(0xFFDBDBDE),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            focusedBorder:
                                const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                            label: Text(
                              "Courier Name",
                              style: CustomTheme.lightTheme()
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                            )),
                      ),
                      Container(
                        height: 58,
                        width: double.infinity,
                        color: CustomColor.secondaryColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: taglineList.isEmpty ? 18 : 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tagline",
                                  style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(
                                      color: CustomColor.customBlack.withOpacity(0.5), fontSize: taglineList.isEmpty ? 18 : 14),
                                ),
                                Container(
                                  height: taglineList.isEmpty ? 25 : 15,
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      taglineList.add(tagline.text.trim());
                                                      tagline.clear();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Add",
                                                      style: CustomTheme.lightTheme()
                                                          .textTheme
                                                          .labelLarge!
                                                          .copyWith(fontSize: 18, color: CustomColor.mainColor),
                                                    )),
                                              ],
                                              title: Text(
                                                "Insert Tagline",
                                                style: CustomTheme.lightTheme()
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(fontSize: 18, color: CustomColor.customBlack),
                                              ),
                                              content: TextFormField(
                                                controller: tagline,
                                                textCapitalization: TextCapitalization.words,
                                                style: CustomTheme.lightTheme()
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                                                cursorColor: const Color(0xFFDBDBDE),
                                                keyboardType: TextInputType.name,
                                                decoration: InputDecoration(
                                                    enabledBorder: const UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                                    focusedBorder: const UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                                    label: Text(
                                                      "Tagline",
                                                      style: CustomTheme.lightTheme()
                                                          .textTheme
                                                          .labelMedium!
                                                          .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                                                    )),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: taglineList.isEmpty ? 25 : 15,
                                        color: CustomColor.customBlack.withOpacity(0.5),
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: taglineList.isNotEmpty ? 25 : 5,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: taglineList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 2),
                                    padding: const EdgeInsets.symmetric( vertical: 2),
                                    decoration: BoxDecoration(
                                      color: CustomColor.taglineColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(width: 13,),
                                        Text(
                                          taglineList[index],
                                          style: CustomTheme.lightTheme()
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: CustomColor.productTextBlack),
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              setState(() {
                                                taglineList.removeAt(index);
                                                if (taglineList.isEmpty) {
                                                  taglineInput = !taglineInput;
                                                }
                                              });
                                            },
                                            icon: const SizedBox(
                                              height: 15,
                                              child: Icon(
                                                Icons.close,
                                                size: 15,
                                              ),
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: CustomColor.customBlack.withOpacity(0.2),
                        height: 2,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ]),
                  )
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
                      StoreModel store = StoreModel(
                          address: address.text.trim(),
                          name: name.text.trim(),
                          city: city.text.trim(),
                          country: country.text.trim(),
                          courierName: courier.text.trim(),
                          description: description.text.trim(),
                          state: state.text.trim(),
                          storeType: storetype.text.trim(),
                          webAddress: webAddress.text.trim(),
                          tagline: taglineList);

                      Navigator.pop(context, store);
                    },
                    child: CustomWidgets().sortingWidget(
                        text: "Create",
                        backgroundColor: CustomColor.mainColor.withOpacity(1),
                        // paddingH: 100,
                        paddingV: 15,
                        textStyle: CustomTheme.lightTheme().textTheme.labelLarge!.copyWith(fontSize: 18)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
