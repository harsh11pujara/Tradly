import 'package:flutter/material.dart';
import 'package:tradly/models/product_model.dart';
import 'package:tradly/utilities/themes.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            FloatingActionButton.small(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: Icon(Icons.arrow_back_sharp),
            ),
            Expanded(child: Container()),
            FloatingActionButton.small(
              onPressed: () {},
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: Icon(Icons.share),
            ),
            FloatingActionButton.small(
              onPressed: () {},
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: Icon(Icons.favorite_border_sharp),
            ),
            FloatingActionButton.small(
              onPressed: () {},
              backgroundColor: CustomColor.secondaryColor.withOpacity(0.2),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 275,
              width: double.infinity,
              child: Image.asset(
                widget.product.img,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: CustomTheme
                      .lightTheme()
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20),
                ),
                const SizedBox(height: 10,),
                Row(children: [
                  Text(
                    "\$${widget.product.price}", style: CustomTheme
                      .lightTheme()
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20, color: CustomColor.mainColor),),
                  const SizedBox(width: 14,),
                  Text("\$25 ",style: CustomTheme
                      .lightTheme()
                      .textTheme
                      .titleSmall!.copyWith(decoration: TextDecoration.lineThrough,color: CustomColor.productTextBlack)),
                  Text("50% off",style: CustomTheme
                      .lightTheme()
                      .textTheme
                      .titleSmall!.copyWith(color: CustomColor.productTextBlack)),
                ],)
              ],
            ),
          )
        ],
      ),
    );
  }
}
