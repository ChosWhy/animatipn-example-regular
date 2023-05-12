
class RestaurantModel{
  final String? url;
  final String? name;
  final double? discount;
  final String? location;
  final double? starPoint;
  bool thereIsDiscount;

  RestaurantModel(
      {this.url, this.name, this.discount, this.location, this.starPoint,required this.thereIsDiscount});
}