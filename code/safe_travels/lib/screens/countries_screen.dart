import 'package:flutter/material.dart';
import 'package:safe_travels/custom/BorderBox.dart';
import 'package:safe_travels/screens/news_subscribe.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:safe_travels/utils/elevated_stylish_button.dart';
import 'package:safe_travels/utils/widget_functions.dart';
//import 'package:safe_travels/utils/widget_functions.dart';
import 'package:country_picker/country_picker.dart';

class CountriesScreen extends StatefulWidget {
  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  String selectedCountry = "";
  String initialSelectionMessage = "Select a country!";
  String selectedCountryCode = "";

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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: padding, vertical: padding),
                child: BorderBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.menu, color: COLOR_BLUE)))
          ]),
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/safetravels.png',
                    width: 300,
                    height: 180,
                  ))),
          addVericalSpace(10 * padding),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2 * padding),
              child: Text('Ready to travel? Pick a country below.',
                  style: TEXT_THEME_DEFAULT.bodyText1)),
          addVericalSpace(4 * padding),
          Center(
              child: SafeTravelsStylishButton(
            text: initialSelectionMessage,
            onPressed: () => {
              showCountryPicker(
                context: context,
                //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                exclude: <String>['KN', 'MF'],
                favorite: <String>['SE'],
                //Optional. Shows phone code before the country name.
                showPhoneCode: false,
                onSelect: (Country country) {
                  selectedCountry = country.name;
                  selectedCountryCode = country.countryCode;
                  setState(() {
                    initialSelectionMessage = selectedCountry;
                  });
                },
                // Optional. Sets the theme for the country list picker.
                countryListTheme: CountryListThemeData(
                  // Optional. Sets the border radius for the bottomsheet.
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
              )
            },
            foreGroundColor: COLOR_WHITE,
            backGroundColor: COLOR_BLUE_PANTONE,
          )),
          addVericalSpace(4 * padding),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2 * padding),
              child: SafeTravelsStylishButton(
                text: "Continue",
                showArrow: true,
                onPressed: () => {
                  if (this.selectedCountry == "")
                    {showSnackBar(context, "Select a country first!")}
                  else
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscribeScreen(
                                country: selectedCountry,
                                country_code: selectedCountryCode)),
                      )
                    }
                },
                foreGroundColor: COLOR_WHITE,
                backGroundColor: COLOR_BLUE_PANTONE,
              ))
        ],
      ),
    )));
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1), //default is 4s
    );
    // Find the Scaffold in the widget tree and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
