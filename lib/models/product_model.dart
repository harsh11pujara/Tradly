class ProductModel{
  final String name;
  final String img;
  final String traderName;
  String? traderLogoImg;
  final String price;
  String? prevPrice;

  ProductModel({required this.name, required this.img, required this.traderName, this.traderLogoImg, required this.price});
}