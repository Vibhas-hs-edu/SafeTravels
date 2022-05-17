import 'dart:convert';
import 'package:safe_travels/utils/models.dart';

class Translator {
  EntryRequirements? getEntryRequirementsFromJson(
      String entryRequirementsJson) {
    var entryRequirements = jsonDecode(entryRequirementsJson);
    assert(entryRequirements is List);
    if (entryRequirements.length > 0) {
      EntryRequirements er = new EntryRequirements(
          headerText: "Entry Requirements",
          mainPoint: entryRequirements[0],
          subPoints: []);
      if (entryRequirements.length > 1) {
        er.subPoints = entryRequirements.cast<String>().sublist(1);
      }
      return er;
    }
    return null;
  }

  CDCAdvisory? getSubAdvisoriesFromJson(
      String levelResponse, String subAdvisoriesResponse) {
    if (levelResponse == "") return null;
    var level = jsonDecode(levelResponse);
    var subAdvisories = jsonDecode(subAdvisoriesResponse);
    assert(subAdvisories is List);
    if (subAdvisories.length > 0) {
      CDCAdvisory cdcAdvisory = new CDCAdvisory(
          headerText: "But... the CDC Advises",
          mainPoint: "Level ${level}:",
          subPoints: subAdvisories.cast<String>());
      return cdcAdvisory;
    }
    return null;
  }

  List<Destination> getDestinationsFromJson(String placesFutureResponse) {
    List<Destination> destinations = [];
    var places = jsonDecode(placesFutureResponse);
    String api_key = "AIzaSyDhLiZ1e1FFUpwuI-FjhdteBEZ7Ns-BVdw";
    int k = 0;
    assert(places is Map);
    if (places.containsKey("results")) {
      var results = places["results"];
      for (int i = 0; i < results.length; i++) {
        if (results[i].containsKey("photos") &&
            results[i]["photos"].length > 0) {
          int j = -1;
          while (j + 1 < results[i]["photos"].length &&
              results[i]["photos"][j + 1]["width"] < 4000 &&
              results[i]["photos"][j + 1]["height"] < 4000) {
            j += 1;
          }
          if (j == -1) continue;
          var photo_url =
              "https://maps.googleapis.com/maps/api/place/photo?maxwidth=1600&photo_reference=${results[i]["photos"][j]["photo_reference"]}&key=${api_key}";
          Destination d = new Destination(
              imagePath: photo_url,
              height: 300,
              width: 300,
              rating: results[i]['rating'] + .0,
              tags: results[i]["types"].cast<String>(),
              priceDescription: "Medium",
              authorName: "John Doe",
              destinationFeedBack: "Awesome Place",
              destinationName: results[i]["name"]);
          destinations.add(d);
          k += 1;
          if (k > 4) break;
        }
      }
    }
    return destinations;
  }

  List<AirBnb> getAirBnbDetailsFromJson(String airBnbDetailsFutureResponse) {
    List<AirBnb> airBnbDetailsReturnList = [];
    var airBnbDetailsList = jsonDecode(airBnbDetailsFutureResponse);
    assert(airBnbDetailsList is List);
    for (int i = 0; i < airBnbDetailsList.length; i++) {
      var tempDetails = airBnbDetailsList[i];
      assert(tempDetails is Map);
      AirBnb airBnbDetails = new AirBnb();
      if (tempDetails.containsKey("guests")) {
        airBnbDetails.guests = tempDetails["guests"] is int
            ? tempDetails['guests'].toDouble()
            : tempDetails['guests'];
      }
      if (tempDetails.containsKey("bedroom")) {
        airBnbDetails.bedrooms = tempDetails["bedroom"] is int
            ? tempDetails['bedroom'].toDouble()
            : tempDetails['bedroom'];
      }
      if (tempDetails.containsKey("baths")) {
        airBnbDetails.baths = tempDetails["baths"] is int
            ? tempDetails['baths'].toDouble()
            : tempDetails['baths'];
      }
      if (tempDetails.containsKey("title")) {
        airBnbDetails.title = tempDetails["title"];
      }
      if (tempDetails.containsKey("caption")) {
        airBnbDetails.caption = tempDetails["caption"];
      }
      if (tempDetails.containsKey("description")) {
        airBnbDetails.description = tempDetails["description"];
      }
      if (tempDetails.containsKey("description")) {
        airBnbDetails.description = tempDetails["description"];
      }
      if (tempDetails.containsKey("image_url")) {
        airBnbDetails.imageUrls = tempDetails["image_url"].cast<String>();
      }
      if (tempDetails.containsKey("beds")) {
        airBnbDetails.beds = tempDetails["beds"] is int
            ? tempDetails['beds'].toDouble()
            : tempDetails['beds'];
      }
      airBnbDetailsReturnList.add(airBnbDetails);
    }
    return airBnbDetailsReturnList;
  }

  WhyGo getVisitReasonsFromJson(String visitReasonsFutureResponse) {
    List<String> mainReasonsList = [];
    List<String> subReasonsList = [];
    var whyGoTempList = jsonDecode(visitReasonsFutureResponse);
    assert(whyGoTempList is List);
    for (int i = 0; i < whyGoTempList.length; i++) {
      mainReasonsList.add(whyGoTempList[i][0].toString());
      subReasonsList.add(whyGoTempList[i][1].toString());
    }
    return new WhyGo(
        headerText: "Why Go?",
        headerPoints: mainReasonsList,
        subPoints: subReasonsList);
  }

  List<String> getCountryImagesFromJson(
      String countryImagesResponse, int slice_images) {
    List<String> countryImagesList = [];
    var countryImagesTempList = jsonDecode(countryImagesResponse);
    assert(countryImagesTempList is List);
    for (int i = 0; i < countryImagesTempList.length; i++) {
      if (i >= slice_images) break;
      countryImagesList.add(countryImagesTempList[i].toString());
    }
    return countryImagesList;
  }

  String getMainImageFromJson(String mainImageResponse) {
    return mainImageResponse;
  }
}
