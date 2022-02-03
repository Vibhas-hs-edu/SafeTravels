import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:safe_travels/screens/landing_screen.dart';
import 'package:safe_travels/utils/constants.dart';
//import 'package:safe_travels/screens/landing_screen.dart';
//SSSimport 'package:safe_travels/screens/continents_screen.dart';
import 'package:safe_travels/screens/countries_screen.dart';
import 'package:safe_travels/screens/continents_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: COLOR_WHITE,
          accentColor: COLOR_DARK_BLUE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat",
        ),
        home: LandingScreen()
      );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Safe Travels"),
        centerTitle: true,
      ),
      body: Column(
        children: [ImageWidget()],
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello World!");
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/Picture_2_Travel1.png');
  }
}