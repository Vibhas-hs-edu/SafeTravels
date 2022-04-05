import 'package:flutter/material.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:safe_travels/utils/models.dart';

import 'package:safe_travels/utils/UnorderedList.dart';
import 'package:safe_travels/utils/tripadvisor.dart';

class MainContentScreen extends StatefulWidget {
  @override
  State<MainContentScreen> createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  int index = 0;

  final TripAdvisory tad =
      new TripAdvisory(headerText: "Tripadvisor", destinations: [
    new Destination(
        imagePath: "assets/images/ExampleMainScreenImages/Dubrovnik.jpeg",
        rating: 5,
        tags: ["Historic Sites", "Historic Walking areas"],
        priceDescription: "Admission tickets from 52.12\$",
        authorName: "BRYNS",
        destinationFeedBack:
            "The city walls of his Medieval city are its most recognizable feature",
        destinationName: "Walls of Dubrovnik"),
    new Destination(
        imagePath: "assets/images/ExampleMainScreenImages/hvar.webp",
        rating: 5,
        tags: ["Night life", "Sunny"],
        priceDescription: "Admission tickets from  100.12\$",
        authorName: "Steff",
        destinationFeedBack:
            "The city walls of his Medieval city are its most recognizable featureHvar island is incredibly sunny, averaging 2718 hours of sunshine a year. In fact, the island is so sunny that hotels are required to provide a free night of accommodation if it snows. ",
        destinationName: "Vrboska")
  ]);

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
                    children: _addChildren(size),
                  ),
                ))));
  }

  List<Widget> _addChildren(Size size) {
    List<Widget> v = [];
    //final double padding = 5.0;
    var headerDisplayWidget = buildHeaderDisplay(size);
    if (headerDisplayWidget != null) {
      v.add(headerDisplayWidget);
    }
    //v.add(addVericalSpace(padding));
    var whyGoWidget = buildWhyGoWidget(size);
    if (whyGoWidget != null) {
      v.add(whyGoWidget);
    }

    var entryRequirementsWidget = buildEntryRequirementsWidget(size);
    if (entryRequirementsWidget != null) {
      v.add(entryRequirementsWidget);
    }

    var cdcAdvisoryWidget = buildCDCAdvisoryWidget(size);
    if (buildCDCAdvisoryWidget != null) {
      v.add(cdcAdvisoryWidget!);
    }

    var feedBackWidget = buildTravelersFeedbackWidget(size);
    if (feedBackWidget != null) {
      v.add(feedBackWidget);
    }

    var healthAdvisoryWidget = buildTripAdvisoryWidget(size);
    if (healthAdvisoryWidget != null) {
      v.add(healthAdvisoryWidget);
    }
    return v;
  }

  Widget? buildHeaderDisplay(Size size) {
    var imagePath = 'assets/images/ExampleMainScreenImages/Croatia.png';
    var headerText = 'Croatia'.toUpperCase();
    HeaderDisplay headerDisplay =
        new HeaderDisplay(imagePath: imagePath, headerText: headerText);
    var imgWidget = new Image(
      image: AssetImage(headerDisplay.imagePath),
      fit: BoxFit.cover,
      height: 300,
      width: double.infinity,
      alignment: Alignment.center,
    );
    return Stack(children: <Widget>[
      imgWidget,
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

  Widget? buildWhyGoWidget(Size size) {
    WhyGo whyGo = new WhyGo(headerText: "Why go?", headerPoints: [
      "Rich in Historical architecture :",
      "Cruise along the coast :"
    ], subPoints: [
      "the medieval old town of Dubrovnik is a UNESCO World Heritage Site",
      "Over 1200 beautiful islands dot the country's Adriatic coastline"
    ]);
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
                      child: Text("Why go?",
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

  Widget? buildEntryRequirementsWidget(Size size) {
    EntryRequirements er = new EntryRequirements(
        headerText: "Entry Requirements",
        mainPoint:
            "Croatia is open to travelers who present one of the following negative viral test",
        subPoints: [
          "PCR not older than 72 hours",
          "Rapid antigen test not older than 48 hours",
          "A certificate of vaccination not older than 365 days..."
        ]);
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

  Widget? buildCDCAdvisoryWidget(Size size) {
    CDCAdvisory cdc = new CDCAdvisory(
        headerText: "But... the CDC Advises",
        mainPoint: "Level 4:",
        subPoint: "Travelers should avoid all travel to Croatia");
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
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(cdc.subPoint, style: TEXT_THEME_DEFAULT.bodyText1),
              )
            ])));
  }

  Widget? buildTravelersFeedbackWidget(Size size) {
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

  Widget? buildTripAdvisoryWidget(Size size) {
    var imageIcon = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.trip_origin,
              color: Colors.black,
              size: 30.0,
              semanticLabel: 'Text to announce in accessibility modes',
            )));
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(children: [
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child:
                      Image.asset("assets/images/TripAdvisor.png", height: 35)),
              TripAdvisorSf(
                destination: this.tad.destinations[index],
                index: index,
              ),
            ])));
  }

  void onNext() {
    if (index < this.tad.destinations.length - 1) {
      setState(() {
        index++;
      });
    }
  }

  void onPrevious() {}
}
