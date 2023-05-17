import 'package:animationexample/consts/icons.dart';
import 'package:flutter/material.dart';
import 'package:animationexample/main_page.dart';
import '../consts/border_radii.dart';
import '../consts/colors.dart';
import '../consts/icon_sizes.dart';
import '../consts/paddings.dart';

abstract class MainPageStateManage extends State<MainPage>{
  double topAnimatedContainerHeigth = 270;
  late final ProjectPaddings paddings;
  late final ProjectIconSizes iconSizes;
  late final ProjectBorderRadii borderRadii;
  late final ProjectColors colors;
  late final MyIcons icons;

  @override
  void initState() {
    super.initState();
    paddings = ProjectPaddings();
    iconSizes = ProjectIconSizes();
    borderRadii = ProjectBorderRadii();
    colors = ProjectColors();
    icons = MyIcons();
  }
}