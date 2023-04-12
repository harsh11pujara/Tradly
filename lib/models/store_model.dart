class StoreModel {
  String? img;
  String? name;
  String? storeLogoImg;
  String? webAddress;
  String? description;
  String? storeType;
  String? address;
  String? city;
  String? state;
  String? country;
  String? courierName;
  List<String>? tagline;

  StoreModel(
      {this.img,
      this.name,
      this.storeLogoImg,
      this.webAddress,
      this.description,
      this.storeType,
      this.address,
      this.city,
      this.state,
      this.country,
      this.courierName,
      this.tagline});
}
