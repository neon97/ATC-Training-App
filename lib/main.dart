import 'package:atc/const/mediaquerry.dart';
import 'package:atc/view/splash_Screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: trainngAppTheme,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SplashScreen();
  }
}
