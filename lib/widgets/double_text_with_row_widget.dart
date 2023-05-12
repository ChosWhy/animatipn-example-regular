import 'package:flutter/material.dart';

class DoubleTextWithRowWidget extends StatelessWidget {
  const DoubleTextWithRowWidget(
      {Key? key, required this.titleOne, required this.titleTwo})
      : super(key: key);
  final String titleOne;
  final String titleTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleOne,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              titleTwo,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: const Color(0xfff1b45b)),
            )),
      ],
    );
  }
}
