import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class CreateProduct extends StatefulWidget {
  CreateProduct({Key? key, this.isEditing = false}) : super(key: key);
  bool? isEditing = false;

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController offerPrice = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController priceType = TextEditingController();
  TextEditingController tagline = TextEditingController();
  List<String> additionalDetailsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          widget.isEditing == false ? "Add Product" : "Edit Product",
          style: CustomTheme.lightTheme().textTheme.labelLarge,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.mainColor,
        elevation: 0,
        toolbarHeight: 90,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 21, right: 15),
                        child: DottedBorder(
                          radius: const Radius.circular(10),
                          color: CustomColor.productTextBlack.withOpacity(0.3),
                          borderType: BorderType.RRect,
                          dashPattern: [3, 3],
                          strokeWidth: 1.5,
                          child: SizedBox(
                            height: 105,
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                Icon(
                                  Icons.add,
                                  color: CustomColor.productTextBlack.withOpacity(0.3),
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Add Photos",
                                  style: CustomTheme.lightTheme()
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: CustomColor.customBlack.withOpacity(0.6)),
                                ),
                                Text(
                                  "1600 x 1200 for hi res",
                                  style: CustomTheme.lightTheme()
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(fontSize: 10, color: CustomColor.customBlack.withOpacity(0.2)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 124,
                            width: 156,
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 108,
                              width: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/vegetableMarket.jpeg",
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: CustomColor.customBlack,
                                child: Icon(
                                  Icons.close,
                                  color: CustomColor.secondaryColor,
                                  size: 15,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "Max. 4 photos per product",
                      style:
                          CustomTheme.lightTheme().textTheme.bodySmall!.copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    color: CustomColor.secondaryColor,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name,
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
                                "Product Name",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: category,
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
                                "Category Product",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: price,
                                textCapitalization: TextCapitalization.words,
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                                cursorColor: const Color(0xFFDBDBDE),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    prefixText: "\$ ",
                                    enabledBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    focusedBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    label: Text(
                                      "Price",
                                      style: CustomTheme.lightTheme()
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: offerPrice,
                                textCapitalization: TextCapitalization.words,
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: CustomColor.textFieldColor, fontSize: 16),
                                cursorColor: const Color(0xFFDBDBDE),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    prefixText: "\$ ",
                                    enabledBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    focusedBorder:
                                        const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFDBDBDE), width: 0.5)),
                                    label: Text(
                                      "Offer Price",
                                      style: CustomTheme.lightTheme()
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                                    )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: location,
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
                                "Location Details",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLines: 5,
                          minLines: 1,
                          controller: description,
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
                                "Product Description",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: priceType,
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
                                "Price Type",
                                style: CustomTheme.lightTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: CustomColor.customBlack.withOpacity(0.5)),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 58,
                          width: double.infinity,
                          color: CustomColor.secondaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: additionalDetailsList.isEmpty ? 18 : 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Additional Details",
                                    style: CustomTheme.lightTheme().textTheme.labelMedium!.copyWith(
                                        color: CustomColor.customBlack.withOpacity(0.5),
                                        fontSize: additionalDetailsList.isEmpty ? 18 : 14),
                                  ),
                                  Container(
                                    height: additionalDetailsList.isEmpty ? 25 : 15,
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
                                                        setState(() {
                                                          additionalDetailsList.add(tagline.text.trim());
                                                        });
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
                                                  "Insert Additional Details",
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
                                                        "Details",
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
                                          size: additionalDetailsList.isEmpty ? 25 : 15,
                                          color: CustomColor.customBlack.withOpacity(0.5),
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: additionalDetailsList.isNotEmpty ? 25 : 5,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: additionalDetailsList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 2),
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      decoration: BoxDecoration(
                                        color: CustomColor.taglineColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            additionalDetailsList[index],
                                            style: CustomTheme.lightTheme()
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: CustomColor.productTextBlack),
                                          ),
                                          IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {
                                                setState(() {
                                                  additionalDetailsList.removeAt(index);
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
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
                      ProductModel product = ProductModel(
                          name: name.text.trim(),
                          price: price.text.trim(),
                          description: description.text.trim(),
                          additionalDetails: additionalDetailsList,
                          category: category.text.trim(),
                          location: location.text.trim(),
                          prevPrice: offerPrice.text.trim(),
                          priceType: priceType.text.trim());

                      Navigator.pop(context, product);
                    },
                    child: CustomWidgets().sortingWidget(
                        text: widget.isEditing == false ? "Add Product" : "Edit Product",
                        backgroundColor: CustomColor.mainColor,
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
