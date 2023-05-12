import 'package:flutter/material.dart';

import 'main_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  final String title = "Animation Example";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(),
      home: const MainPage(),
    );
  }
}
