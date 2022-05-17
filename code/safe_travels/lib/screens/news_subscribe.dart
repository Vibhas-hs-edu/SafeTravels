import 'package:flutter/material.dart';
import 'package:safe_travels/custom/BorderBox.dart';
import 'package:safe_travels/screens/countries_screen.dart';
import 'package:safe_travels/screens/signup_screen.dart';
import 'package:safe_travels/utils/checkbox.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:safe_travels/utils/icon_button.dart';
import 'package:safe_travels/utils/models.dart';

class SubscribeScreen extends StatefulWidget {
  final String? country;
  final String? country_code;
  @override
  SubscribeScreen({Key? key, required this.country, required this.country_code})
      : super(key: key);
  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  final double padding = 8;
  final imageAttributesWrapperList = <ImageAttributesWrapper>[
    ImageAttributesWrapper(
        firstImageAttributes: ImageAttributes(
            imagePath: 'assets/images/EntryRequirements.png',
            imageText: 'Entry Requirements'),
        secondImageAttributes: ImageAttributes(
            imagePath: 'assets/images/CovidStats.png',
            imageText: 'Covid Stats')),
    ImageAttributesWrapper(
        firstImageAttributes: ImageAttributes(
            imagePath: 'assets/images/InteractiveMap.png',
            imageText: 'Interactive Map'),
        secondImageAttributes: ImageAttributes(
            imagePath: 'assets/images/CDC.png', imageText: 'CDC')),
    ImageAttributesWrapper(
        firstImageAttributes: ImageAttributes(
            imagePath: 'assets/images/PhotoGallery.png',
            imageText: 'Photo Gallery'),
        secondImageAttributes: ImageAttributes(
            imagePath: 'assets/images/TravellersReports.png',
            imageText: "Travelers' Reports")),
    ImageAttributesWrapper(
        firstImageAttributes: ImageAttributes(
            imagePath: 'assets/images/TravelNews.png',
            imageText: 'Travel News'),
        secondImageAttributes: ImageAttributes(
            imagePath: 'assets/images/TravelDeals.png',
            imageText: "Travelers Deals"))
  ];

  String _image1 = 'assets/images/EntryRequirements.png';
  String _text1 = 'Entry Requirements';
  String _image2 = 'assets/images/CDC.png';
  String _text2 = 'COVID Stats';
  bool _checkBox1 = false;
  bool _checkBox2 = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Container(
              child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: padding, vertical: padding),
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
                  width: 170,
                  //height : 150,
                ))),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 2 * padding, 0, 0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  '$_image1',
                  width: 250,
                  //height : 150,
                ))),
        Row(mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 4.5 * padding)),
              Text(
                '$_text1',
                style: TEXT_THEME_DEFAULT_BLUE.headline4,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
                  child: CheckBoxSf(
                      imageAttributes: imageAttributesWrapperList[index]
                          .firstImageAttributes))
            ]),
        Padding(
            padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  '$_image2',
                  width: 250,
                  //height : 150,
                ))),
        Row(mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 4.5 * padding)),
              Text(
                '$_text2',
                style: TEXT_THEME_DEFAULT_BLUE.headline4,
              ),
              Text(''),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3 * padding, vertical: padding),
                  child: CheckBoxSf(
                      imageAttributes: imageAttributesWrapperList[index]
                          .secondImageAttributes))
            ]),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(2 * padding, 0, 0, 0),
                  child: BorderBox(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 120,
                      height: 40,
                      child: IconButtonWidget(
                        icon: Icons.arrow_back_ios_sharp,
                        onPressed: () {
                          onPrevious();
                        },
                      ))),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 2 * padding, 0),
                  child: BorderBox(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 120,
                      height: 40,
                      child: IconButtonWidget(
                          icon: Icons.arrow_forward_ios_sharp,
                          onPressed: () {
                            onNext();
                          }))),
            ]))
      ]))),
    );
  }

  void onNext() {
    if (index < this.imageAttributesWrapperList.length - 1) {
      index++;
      setState(() {
        this._image1 = this
            .imageAttributesWrapperList[index]
            .firstImageAttributes
            .imagePath;
        this._image2 = this
            .imageAttributesWrapperList[index]
            .secondImageAttributes
            .imagePath;
        this._text1 = this
            .imageAttributesWrapperList[index]
            .firstImageAttributes
            .imageText;
        this._text2 = this
            .imageAttributesWrapperList[index]
            .secondImageAttributes
            .imageText;
        this._checkBox1 = this
            .imageAttributesWrapperList[index]
            .firstImageAttributes
            .isChecked;
        this._checkBox2 = this
            .imageAttributesWrapperList[index]
            .secondImageAttributes
            .isChecked;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUpScreen(
                imageAttributesWrapper: this.imageAttributesWrapperList,
                country: widget.country,
                country_code: widget.country_code)),
      );
    }
  }

  void onPrevious() {
    if (index > 0) {
      index--;
      setState(() {
        this._image1 = this
            .imageAttributesWrapperList[index]
            .firstImageAttributes
            .imagePath;
        this._image2 = this
            .imageAttributesWrapperList[index]
            .secondImageAttributes
            .imagePath;
        this._text1 = this
            .imageAttributesWrapperList[index]
            .firstImageAttributes
            .imageText;
        this._text2 = this
            .imageAttributesWrapperList[index]
            .secondImageAttributes
            .imageText;
        this._checkBox1 = this
            .imageAttributesWrapperList[index]
            .firstImageAttributes
            .isChecked;
        this._checkBox2 = this
            .imageAttributesWrapperList[index]
            .secondImageAttributes
            .isChecked;
      });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CountriesScreen()));
    }
  }
}
