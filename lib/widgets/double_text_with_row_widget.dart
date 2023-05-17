import 'package:animationexample/consts/colors.dart';
import 'package:animationexample/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class DoubleTextWithRowWidget extends StatelessWidget {
  DoubleTextWithRowWidget(
      {Key? key, required this.titleOne, required this.titleTwo})
      : super(key: key);
  final String titleOne;
  final String titleTwo;
  final ProjectColors _colors = ProjectColors();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleOne,
          style: context.textTheme().titleLarge,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              titleTwo,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: _colors.goldenHour),
            )),
      ],
    );
  }
}
