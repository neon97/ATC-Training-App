import 'dart:async';
import 'package:atc/const/mediaquerry.dart';
import 'package:atc/utils/router.dart';
import 'package:atc/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimerForSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        color: appThemeColor,
        child: Center(
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }

  //functions
  startTimerForSplash() {
    Timer(Duration(seconds: 2), _moveToHome);
  }

  _moveToHome() {
    routeTo(context, HomeScreen());
  }
}
