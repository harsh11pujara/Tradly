class ProductModel {
  final String name;
  String? img;
  String? traderName;
  String? traderLogoImg;
  final String price;
  String? prevPrice;
  String? category;
  String? location;
  String? description;
  String? priceType;
  List<String>? additionalDetails;

  ProductModel(
      {required this.name,
      this.img,
      this.traderName,
      this.traderLogoImg,
      required this.price,
      this.prevPrice,
      this.category,
      this.location,
      this.description,
      this.priceType,
      this.additionalDetails});
}
