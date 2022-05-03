import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

class MyCountryApp extends StatefulWidget {
  @override
  MyCountryAppState createState() => MyCountryAppState();
}

class MyCountryAppState extends State<MyCountryApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CountryListPick(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Pick your country'),
        ),
        // if you need custome picker use this
        theme: CountryTheme(
          isShowFlag: true,
          isShowTitle: true,
          isShowCode: false,
          isDownIcon: true,
          showEnglishName: false,
          labelColor: Colors.amberAccent,
        ),
        // or
        initialSelection: 'US',
        onChanged: (CountryCode? code) {
          if (code != null) {
            print(code.name);
            print(code.code);
            print(code.dialCode);
            print(code.flagUri);
          }
        },
      ),
    );
  }
}
