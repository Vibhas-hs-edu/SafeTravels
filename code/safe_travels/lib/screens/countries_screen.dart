import 'package:flutter/material.dart';
import 'package:safe_travels/custom/BorderBox.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:safe_travels/utils/widget_functions.dart';
//import 'package:safe_travels/utils/widget_functions.dart';
import 'package:safe_travels/utils/dropdown.dart';
import 'package:safe_travels/utils/countries.dart';

class CountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 8;
    //final ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child:
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                    'assets/images/Picture_2_Travel1.png',
                      width : 170,
                      //height : 150,
                    ))),
              Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: 
                BorderBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.menu, color: COLOR_BLUE))
            )
          ]),  
        Row(children: [
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 2*padding),
              child: 
              Text('SafeTravels', style: TEXT_THEME_DEFAULT.headline1)
            )
        ]),
        addVericalSpace(4*padding),
        Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 2*padding),
              child: 
              Text('Ready to travel? Pick a country below!', style: TEXT_THEME_DEFAULT.bodyText1)
            ),
        addVericalSpace(4*padding),
          MyCountryApp()
        ],
      ),
    )));
  }
}