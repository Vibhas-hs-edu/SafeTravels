import 'package:flutter/material.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:safe_travels/utils/images_collage.dart';
import 'package:safe_travels/utils/models.dart';
import 'package:safe_travels/utils/server.dart';

import 'package:safe_travels/utils/UnorderedList.dart';
import 'package:safe_travels/utils/model_translator.dart';
import 'package:safe_travels/utils/photo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainContentScreen extends StatefulWidget {
  final List<ImageAttributesWrapper> imageAttributesWrapper;
  final String? country;
  final String? country_code;
  @override
  MainContentScreen(
      {Key? key,
      required this.imageAttributesWrapper,
      required this.country,
      required this.country_code});
  @override
  State<MainContentScreen> createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  int index = 0;
  List<Widget> w = [];

  final TripAdvisory tad =
      new TripAdvisory(headerText: "Tripadvisor", destinations: [
    new Destination(
        imagePath: "assets/images/ExampleMainScreenImages/Dubrovnik.jpeg",
        height: 300,
        width: 300,
        rating: 5,
        tags: ["Historic Sites", "Historic Walking areas"],
        priceDescription: "Admission tickets from 52.12\$",
        authorName: "BRYNS",
        destinationFeedBack:
            "The city walls of his Medieval city are its most recognizable feature",
        destinationName: "Walls of Dubrovnik"),
    new Destination(
        imagePath: "assets/images/ExampleMainScreenImages/hvar.webp",
        height: 300,
        width: 300,
        rating: 5,
        tags: ["Night life", "Sunny"],
        priceDescription: "Admission tickets from  100.12\$",
        authorName: "Steff",
        destinationFeedBack:
            "The city walls of his Medieval city are its most recognizable featureHvar island is incredibly sunny, averaging 2718 hours of sunshine a year. In fact, the island is so sunny that hotels are required to provide a free night of accommodation if it snows. ",
        destinationName: "Vrboska")
  ]);

  @override
  void initState() {
    super.initState();
    print('Inside Init state');
    this._addChildren();
  }

  bool isChecked(String text) {
    for (var i = 0; i < widget.imageAttributesWrapper.length; i++) {
      if (widget.imageAttributesWrapper[i].firstImageAttributes.imageText ==
          text) {
        return widget.imageAttributesWrapper[i].firstImageAttributes.isChecked;
      } else if (widget
              .imageAttributesWrapper[i].secondImageAttributes.imageText ==
          text) {
        return widget.imageAttributesWrapper[i].secondImageAttributes.isChecked;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final double padding = 8;
    //final ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: w,
                  ),
                ))));
  }

  void _addChildren() async {
    //final double padding = 5.0;
    var headerDisplayWidgetFuture = buildHeaderDisplay();
    var headerDisplayWidget = await headerDisplayWidgetFuture;
    if (headerDisplayWidget != null) {
      setState(() {
        this.w.add(headerDisplayWidget);
      });
    }

    var whyGoWidgetFuture = buildWhyGoWidget();

    var whyGoWidget = await whyGoWidgetFuture;

    if (whyGoWidget != null) {
      setState(() {
        this.w.add(whyGoWidget);
      });
    }

    var entryRequirementsWidgetFuture = buildEntryRequirementsWidget();
    var entryRequirementsWidget = await entryRequirementsWidgetFuture;

    if (entryRequirementsWidget != null) {
      setState(() {
        this.w.add(entryRequirementsWidget);
      });
    }

    var cdcAdvisoryWidgetFuture = buildCDCAdvisoryWidget();
    var cdcAdvisoryWidget = await cdcAdvisoryWidgetFuture;

    if (cdcAdvisoryWidget != null) {
      setState(() {
        this.w.add(cdcAdvisoryWidget);
      });
    }

    var tripAdvisoryWidgetFuture = buildTripAdvisoryWidget();
    var tripAdvisoryWidget = await tripAdvisoryWidgetFuture;
    if (tripAdvisoryWidget != null) {
      setState(() {
        this.w.add(tripAdvisoryWidget);
      });
    }

    var airBnbWidgetFuture = buildAirBnbWidget();
    var airBnbWidget = await airBnbWidgetFuture;
    if (airBnbWidget != null) {
      setState(() {
        this.w.add(airBnbWidget);
      });
    }
    var imagesCollageWidgetFuture = buildImagesCollageWidget();
    var imagesCollageWidget = await imagesCollageWidgetFuture;
    if (imagesCollageWidget != null) {
      setState(() {
        this.w.add(imagesCollageWidget);
      });
    }
    var contactUsWidgetFuture = buildContactSafeTravelsWidget();

    var contactUsWidget = await contactUsWidgetFuture;
    if (contactUsWidget != null) {
      setState(() {
        this.w.add(contactUsWidget);
      });
    }

    var socialMediaShareWidgetFuture = buildSocialMediaShareWidget();
    var socialMediaShareWidget = await socialMediaShareWidgetFuture;

    if (socialMediaShareWidget != null) {
      setState(() {
        this.w.add(socialMediaShareWidget);
      });
    }
  }

  Future<Widget?> buildHeaderDisplay() async {
    Server s = new Server();
    Translator t = new Translator();
    var imageUrl = await s.get_main_image(widget.country);
    var finalImageUrl = t.getMainImageFromJson(imageUrl.body);
    var headerText = widget.country!.toUpperCase();
    return Stack(children: <Widget>[
      new CachedNetworkImage(
        imageUrl: finalImageUrl,
        fit: BoxFit.cover,
        height: 300,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("SafeTravels",
              style: TextStyle(
                  color: TEXT_THEME_DEFAULT_BLUE.headline1!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          Text(headerText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30))
        ])
      ])
    ]);
  }

  Future<Widget?> buildWhyGoWidget() async {
    if (!this.isChecked("Why Go?")) {
      return null;
    }

    Server s = new Server();
    Translator t = new Translator();
    var visit_reasons = await s.get_visit_reasons(widget.country);
    WhyGo whyGo = t.getVisitReasonsFromJson(visit_reasons.body);

    const Padding flightIcon = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.flight,
              color: Colors.black,
              size: 30.0,
              semanticLabel: 'Text to announce in accessibility modes',
            )));
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: [
              Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(254, 128, 13, 0.9)),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Text('', textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text(whyGo.headerText,
                          style: TEXT_THEME_DEFAULT.headline4,
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: flightIcon,
                    )
                  ])),
              Padding(
                padding: EdgeInsets.all(5),
                child: UnorderedList(whyGo.headerPoints, whyGo.subPoints),
              )
            ])));
  }

  Future<Widget?> buildEntryRequirementsWidget() async {
    if (!this.isChecked("Entry Requirements")) {
      return null;
    }
    Server s = new Server();
    Translator t = new Translator();
    var entryRequirementsResponse =
        await s.get_entry_requirements(widget.country);
    EntryRequirements? er =
        t.getEntryRequirementsFromJson(entryRequirementsResponse.body);
    if (er == null) {
      return null;
    }
    const Padding flightIcon = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.public,
              color: Colors.black,
              size: 30.0,
              semanticLabel: 'Entry requirements icon',
            )));
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: [
              Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(241, 20, 166, 0.9)),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Text('', textAlign: TextAlign.left),
                    ),
                    Text(er.headerText,
                        style: TEXT_THEME_DEFAULT.headline4,
                        textAlign: TextAlign.center),
                    Expanded(
                      child: flightIcon,
                    )
                  ])),
              Padding(
                  padding: EdgeInsets.all(10),
                  child:
                      Text(er.mainPoint, style: TEXT_THEME_DEFAULT.bodyText1)),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: UnorderedList([], er.subPoints),
              )
            ])));
  }

  Future<Widget?> buildCDCAdvisoryWidget() async {
    if (!this.isChecked("CDC")) {
      return null;
    }

    Server s = new Server();
    Translator t = new Translator();
    var level = await s.get_notice(widget.country);
    var subAdvisoriesResponse = await s.get_sub_advisories(widget.country);
    CDCAdvisory? cdc =
        t.getSubAdvisoriesFromJson(level.body, subAdvisoriesResponse.body);
    if (cdc == null) {
      return null;
    }

    /*CDCAdvisory cdc = new CDCAdvisory(
        headerText: "But... the CDC Advises",
        mainPoint: "Level 4:",
        subPoint: "Travelers should avoid all travel to Croatia");*/
    const Padding warningIcon = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.warning,
              color: Colors.black,
              size: 30.0,
              semanticLabel: 'Warning icon',
            )));
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: [
              Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(255, 0, 0, 0.9)),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Text('', textAlign: TextAlign.left),
                    ),
                    Text(cdc.headerText,
                        style: TEXT_THEME_DEFAULT.headline4,
                        textAlign: TextAlign.center),
                    Expanded(
                      child: warningIcon,
                    )
                  ])),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(cdc.mainPoint, style: TEXT_THEME_DEFAULT.headline4),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: UnorderedList([], cdc.subPoints),
              )
            ])));
  }

  Widget? buildTravelersFeedbackWidget() {
    if (!this.isChecked("Travelers' Reports")) {
      return null;
    }
    TravelersFeedback tfb = new TravelersFeedback(
        headerText: "Traveler Feedback",
        feedBack:
            ''' "We just returned from a week of sailing around Croatia and visited both Dubrovnik and Hvar, which were far less crowded than we expected. We felt totally informed before we got there by checking SafeTravels before we left!" ''',
        author: "Serena P., New York");
    const Padding feedBackIcon = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.feedback,
              color: Colors.black,
              size: 30.0,
              semanticLabel: 'Warning icon',
            )));
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: [
              Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(95, 207, 255, 0.9)),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Text('', textAlign: TextAlign.left),
                    ),
                    Text(tfb.headerText,
                        style: TEXT_THEME_DEFAULT.headline4,
                        textAlign: TextAlign.center),
                    Expanded(
                      child: feedBackIcon,
                    )
                  ])),
              Padding(
                padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: Text(tfb.feedBack, style: TEXT_THEME_DEFAULT.bodyText1),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(tfb.author, style: TEXT_THEME_DEFAULT.headline4),
              )
            ])));
  }

  Future<Widget?> buildTripAdvisoryWidget() async {
    if (!this.isChecked("Trip Advisor")) {
      return null;
    }
    Server s = new Server();
    Translator t = new Translator();
    var placesFutureResponse = await s.get_places(widget.country_code);
    List<Destination> destinations =
        t.getDestinationsFromJson(placesFutureResponse.body);
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Image.asset("assets/images/TripAdvisor.png",
                          height: 35)),
                  ImageListTripAdvisorWidget(
                    destinations: destinations,
                  )
                ]))));
  }

  Future<Widget?> buildAirBnbWidget() async {
    if (!this.isChecked("airbnb")) {
      return null;
    }
    Server s = new Server();
    Translator t = new Translator();
    var airBnbDetailsFuture = await s.get_air_bnb_details(widget.country);
    List<AirBnb> airBnbs = t.getAirBnbDetailsFromJson(airBnbDetailsFuture.body);
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child:
                          Image.asset("assets/images/AirBnB.png", height: 35)),
                  ImageListAirBnbWidget(
                    airBnbs: airBnbs,
                  )
                ]))));
  }

  Future<Widget?> buildImagesCollageWidget() async {
    if (!this.isChecked("Photo Gallery")) {
      return null;
    }
    Server s = new Server();
    Translator t = new Translator();
    var imageUrls = await s.get_country_images(widget.country);
    List<String> imageUrlLists = t.getCountryImagesFromJson(imageUrls.body, 9);
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(children: [
            Container(
                decoration: BoxDecoration(color: Colors.yellow),
                child: Row(children: <Widget>[
                  Expanded(child: Text('', textAlign: TextAlign.left)),
                  Text("Get Inspired: Photo Gallery",
                      style: TEXT_THEME_DEFAULT.headline4,
                      textAlign: TextAlign.center),
                  Expanded(
                      child: Icon(
                    Icons.camera,
                    color: Colors.black,
                    size: 30.0,
                    semanticLabel: 'Gallery Icon',
                  ))
                ])),
            ImagesCollageSf(imagePaths: imageUrlLists)
          ]),
        ));
  }

  Future<Widget?> buildContactSafeTravelsWidget() async {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Container(
            child: Column(children: [
          Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("contact@safetravels.com",
                        style: TEXT_THEME_DEFAULT.headline4,
                        textAlign: TextAlign.center)
                  ]))
        ])));
  }

  Future<Widget?> buildSocialMediaShareWidget() async {
    return Container(
      child: Column(children: [
        Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.facebook,
                        color: Colors.black,
                        size: 20.0,
                        semanticLabel: 'Facebook Icon',
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 20.0,
                        semanticLabel: 'Alarm Icon',
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 20.0,
                        semanticLabel: 'Notifications Icon',
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 20.0,
                        semanticLabel: 'Email Icon',
                      ))
                ])),
      ]),
    );
  }
}
