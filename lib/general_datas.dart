import 'models/restaurant_model.dart';

class GeneralDatas {
  static List<bool> menuList = [false, false, false, false, false];
  static List<String> menuTitleList = [
    "Pasta",
    "Soup",
    "Burger",
    "Pizza",
    "Chicken"
  ];
  static List<String> menuImageUrlList = [
    "assets/images/pasta.png",
    "assets/images/soup.png",
    "assets/images/burger.png",
    "assets/images/pizza.png",
    "assets/images/chicken.png",
  ];

  static List<RestaurantModel> restaurants = [
    RestaurantModel(
        url: "assets/images/el_gaucho.jpg",
        discount: 10,
        name: "El Gaucho",
        location: "76A Eigth Avenue, New York",
        starPoint: 4.3,
        thereIsDiscount: true),
    RestaurantModel(
        url: "assets/images/kamer.jpg",
        discount: 10,
        name: "Kamer",
        location: "76A Eigth Avenue, New York",
        starPoint: 4.4,
        thereIsDiscount: false),
    RestaurantModel(
        url: "assets/images/koral.jpg",
        discount: 10,
        name: "Koral",
        location: "76A Eigth Avenue, New York",
        starPoint: 4.8,
        thereIsDiscount: true),
    RestaurantModel(
        url: "assets/images/paris.jpg",
        discount: 10,
        name: "Paris",
        location: "76A Eigth Avenue, New York",
        starPoint: 4.9,
        thereIsDiscount: true),
    RestaurantModel(
        url: "assets/images/queb_lounge.jpg",
        discount: 10,
        name: "Queb Lounge",
        location: "76A Eigth Avenue, New York",
        starPoint: 4.5,
        thereIsDiscount: true),
    RestaurantModel(
        url: "assets/images/revolving.jpg",
        discount: 10,
        name: "Revolving",
        location: "76A Eigth Avenue, New York",
        starPoint: 4.2,
        thereIsDiscount: false),
  ];
}
