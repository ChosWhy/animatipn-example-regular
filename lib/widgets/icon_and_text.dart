import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({
    super.key, required this.title, required this.icon, this.iconSize, required this.iconColor,
  });
  final String title;
  final IconData icon;
  final double? iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: iconSize ?? 20,color: iconColor,),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(title),
        ),
      ],
    );
  }
}