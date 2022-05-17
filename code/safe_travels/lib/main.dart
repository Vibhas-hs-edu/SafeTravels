import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:safe_travels/screens/landing_screen.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_picker/country_picker.dart';

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
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat",
        ),
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
          const Locale('es'),
          const Locale('el'),
          const Locale('et'),
          const Locale('nb'),
          const Locale('nn'),
          const Locale('pl'),
          const Locale('pt'),
          const Locale('ru'),
          const Locale('hi'),
          const Locale('ne'),
          const Locale('uk'),
          const Locale('hr'),
          const Locale('tr'),
          const Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
          const Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
        ],
        localizationsDelegates: [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: LandingScreen());
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
    return Image.asset('assets/images/SafeTravels.png');
  }
}
