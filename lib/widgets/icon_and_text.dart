import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget with _iconAndTextUtility {
  IconAndText({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize,
    required this.iconColor,
  });

  final String title;
  final IconData icon;
  final double? iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize ?? defaultIconSize,
          color: iconColor,
        ),
        Padding(
          padding: xxxSmallOnlyPadding,
          child: Text(title),
        ),
      ],
    );
  }
}

mixin _iconAndTextUtility {
  final EdgeInsets xxxSmallOnlyPadding = const EdgeInsets.only(left: 5.0);
  final double defaultIconSize = 20;
}
