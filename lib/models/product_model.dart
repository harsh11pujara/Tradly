class ProductModel{
  final String name;
  final String img;
  final String traderName;
  String? traderLogoImg;
  final String price;
  String? prevPrice;

  ProductModel(this.name, this.img, this.traderName, this.traderLogoImg, this.price);
}