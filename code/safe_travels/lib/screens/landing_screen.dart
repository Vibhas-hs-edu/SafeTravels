import 'package:flutter/material.dart';
import 'package:safe_travels/custom/BorderBox.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:safe_travels/utils/widget_functions.dart';
import 'package:safe_travels/utils/button.dart';
import 'countries_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 8;
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding, vertical: padding),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BorderBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.menu, color: COLOR_BLUE))
                            ])),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              'assets/images/safetravels.png',
                              width: 300,
                              height: 180,
                            ))),
                    addVericalSpace(padding),
                    //Text('SafeTravels', style: TEXT_THEME_DEFAULT.headline1),
                    Expanded(
                        child: Center(
                            child: Text(
                                'Get real-time travel information at fingertips!',
                                style: themeData.textTheme.bodyText1))),
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: SafeTravelsButton(
                          width: 343,
                          height: 52,
                          backGroundColor: Colors.white,
                          foreGroundColor: COLOR_BLUE,
                          text: "Let's Go!",
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountriesScreen()),
                            )
                          },
                        ))
                  ],
                ))));
  }
}
