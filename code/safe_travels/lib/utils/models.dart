class ImageAttributes {
  final String imagePath;
  final String imageText;
  bool isChecked;

  ImageAttributes(
      {required this.imagePath,
      required this.imageText,
      this.isChecked = false});
}

class ImageAttributesWrapper {
  final ImageAttributes firstImageAttributes;
  final ImageAttributes secondImageAttributes;

  ImageAttributesWrapper(
      {required this.firstImageAttributes,
      required this.secondImageAttributes});
}

class HeaderDisplay {
  final String imagePath;
  final String headerText;

  HeaderDisplay({required this.imagePath, required this.headerText});
}

class WhyGo {
  final String headerText;

  final List<String> headerPoints;
  final List<String> subPoints;
  WhyGo(
      {required this.headerText,
      required this.headerPoints,
      required this.subPoints});
}

class EntryRequirements {
  final String headerText;

  final String mainPoint;
  List<String> subPoints;
  EntryRequirements(
      {required this.headerText,
      required this.mainPoint,
      required this.subPoints});
}

class CDCAdvisory {
  final String headerText;

  final String mainPoint;
  List<String> subPoints;
  CDCAdvisory(
      {required this.headerText,
      required this.mainPoint,
      required this.subPoints});
}

class TravelersFeedback {
  final String headerText;

  final String feedBack;
  final String author;
  TravelersFeedback(
      {required this.headerText, required this.feedBack, required this.author});
}

class TripAdvisory {
  final List<Destination> destinations;
  final String headerText;

  TripAdvisory({required this.headerText, required this.destinations});
}

class Destination {
  final String imagePath;
  final double rating;
  final double height;
  final double width;
  final List<String> tags;
  final String priceDescription;
  final String authorName;
  final String destinationFeedBack;
  final String destinationName;

  Destination(
      {required this.imagePath,
      required this.rating,
      required this.height,
      required this.width,
      required this.tags,
      required this.priceDescription,
      required this.authorName,
      required this.destinationFeedBack,
      required this.destinationName});
}

class AirBnb {
  List<String> imageUrls;
  double guests;
  double beds;
  double bedrooms;
  double baths;
  String title;
  String caption;
  String description;
  AirBnb(
      {this.imageUrls = const [],
      this.guests = 0.0,
      this.beds = 0.0,
      this.bedrooms = 0.0,
      this.baths = 0.0,
      this.title = "",
      this.caption = "",
      this.description = ""});
}

class PhotoGallery {
  final String headerText;
  final String imagePath;

  PhotoGallery({required this.headerText, required this.imagePath});
}
