import 'package:animationexample/consts/colors.dart';
import 'package:animationexample/consts/icons.dart';
import 'package:animationexample/consts/sizes.dart';
import 'package:animationexample/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

import '../consts/border_radii.dart';
import '../consts/paddings.dart';
import 'icon_and_text.dart';

class RestaurantCardWidget extends StatelessWidget
    with _RestaurantCardWidgetUtility {
  RestaurantCardWidget({
    super.key,
    this.imageUrl,
    this.name,
    this.discount,
    this.location,
    this.starPoint,
    required this.isThereDiscount,
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
          borderRadius: _borderRadii.generalNormalBorderRadiusCircular,
          boxShadow: [
            BoxShadow(
                color: _colors.black12,
                spreadRadius: ProjectSizes.kTwo,
                blurRadius: ProjectSizes.kTwo)
          ]),
      height: cardSize,
      child: Row(
        children: [
          //image
          Container(
            width: cardSize,
            decoration: BoxDecoration(
              borderRadius: _borderRadii.generalNormalBorderRadiusCircular,
              image: DecorationImage(
                  image: AssetImage(imageUrl ?? ""), fit: BoxFit.cover),
            ),
          ),
          //contents
          Expanded(
            child: Padding(
              padding: _paddings.generalSmallOnlyLeftPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: isThereDiscount
                                ? _colors.goldenHour
                                : _colors.transparent,
                            borderRadius:
                                customBottomLeftAndTopRightBorderRadius),
                        padding: customSymmetricHorizontalAndVerticalPadding,
                        child: Text(
                          isThereDiscount ? "$discount% OFF" : "",
                          style: context.textTheme().titleSmall,
                        ),
                      ),
                    ],
                  ),
                  //Restaurant name
                  Text(name ?? ""),
                  Padding(
                    padding: _paddings.generalSmallOnlyTopPadding / 2,
                    child: IconAndText(
                        title: location ?? "",
                        icon: _icons.placeIcon,
                        iconColor: Colors.black),
                  ),
                  Padding(
                    padding: _paddings.generalSmallOnlyTopPadding,
                    child: IconAndText(
                      title: "$starPoint",
                      icon: _icons.starIcon,
                      iconColor: _colors.goldenHour,
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

mixin _RestaurantCardWidgetUtility {
  final MyIcons _icons = MyIcons();
  final ProjectColors _colors = ProjectColors();
  final ProjectPaddings _paddings = ProjectPaddings();
  final ProjectBorderRadii _borderRadii = ProjectBorderRadii();
  final double cardSize = 100;
  final BorderRadius customBottomLeftAndTopRightBorderRadius =
      const BorderRadius.only(
          bottomLeft: Radius.circular(10), topRight: Radius.circular(10));
  final EdgeInsets customSymmetricHorizontalAndVerticalPadding =
      const EdgeInsets.symmetric(horizontal: 5, vertical: 2);
}
