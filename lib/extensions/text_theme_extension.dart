import 'package:flutter/material.dart';

///theme da context oldugu için context üzerinden okumak için extension ayarlıyalım

extension BuildContextExtension on BuildContext{
  TextTheme textTheme(){
    return Theme.of(this).textTheme;
  }
}