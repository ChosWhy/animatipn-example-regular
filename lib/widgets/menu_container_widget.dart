import 'package:animationexample/consts/border_radii.dart';
import 'package:animationexample/consts/colors.dart';
import 'package:animationexample/consts/paddings.dart';
import 'package:flutter/material.dart';

import '../general_datas.dart';

class MenuContainerWidget extends StatelessWidget with _MenuContainerUtility {
  MenuContainerWidget({
    super.key,
    required this.index,
    required this.imageUrl,
    required this.menuTitle,
  });

  final int index;
  final String imageUrl;
  final String menuTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index != (GeneralDatas.menuList.length - 1)
          ? _paddings.generalSmallOnlyRightPadding
          : EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: menuSize,
            width: menuSize,
            decoration: BoxDecoration(
              color: _colors.goldenHour,
              borderRadius: _borderRadii.generalNormalBorderRadiusCircular,
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: _paddings.generalSmallOnlyTopPadding,
            child: Text(menuTitle),
          ),
        ],
      ),
    );
  }
}

mixin _MenuContainerUtility {
  final ProjectPaddings _paddings = ProjectPaddings();
  final ProjectColors _colors = ProjectColors();
  final ProjectBorderRadii _borderRadii = ProjectBorderRadii();
  final double menuSize = 80;
}
