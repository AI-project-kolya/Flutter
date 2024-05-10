class PriceModel {
  final String message;
  final String priceRange;

  PriceModel({required this.message, required this.priceRange});

  factory PriceModel.fromJson(json) {
    return PriceModel(
        message: json["message"], priceRange: json["price_range"]);
  }
}
