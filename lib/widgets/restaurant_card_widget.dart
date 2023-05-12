import 'package:animationexample/consts/colors.dart';
import 'package:flutter/material.dart';

import 'icon_and_text.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    super.key,
    this.imageUrl,
    this.name,
    this.discount,
    this.location,
    this.starPoint, required this.isThereDiscount,
  });

  final String? imageUrl;
  final String? name;
  final double? discount;
  final String? location;
  final double? starPoint;
  final bool isThereDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2)
          ]),
      height: 100,
      child: Row(
        children: [
          //image
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imageUrl ?? ""), fit: BoxFit.cover),
            ),
          ),
          //contents
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: isThereDiscount ? ProjectColors.goldenHour : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Text(
                          isThereDiscount ? "$discount% OFF" : "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  //Restaurant name
                  Text(name ?? ""),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: IconAndText(
                        title: location ?? "",
                        icon: Icons.place_outlined,
                        iconColor: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: IconAndText(
                      title: "$starPoint",
                      icon: Icons.star,
                      iconColor: ProjectColors.goldenHour,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
