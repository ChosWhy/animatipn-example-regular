import 'package:flutter/material.dart';

import '../general_datas.dart';

class MenuContainerWidget extends StatelessWidget {
  const MenuContainerWidget({
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
          ? const EdgeInsets.only(right: 10)
          : EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: const Color(0xfff9f0e7),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(menuTitle),
          ),
        ],
      ),
    );
  }
}
