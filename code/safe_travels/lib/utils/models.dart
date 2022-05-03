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
  final List<String> subPoints;
  EntryRequirements(
      {required this.headerText,
      required this.mainPoint,
      required this.subPoints});
}

class CDCAdvisory {
  final String headerText;

  final String mainPoint;
  final String subPoint;
  CDCAdvisory(
      {required this.headerText,
      required this.mainPoint,
      required this.subPoint});
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
  final List<String> tags;
  final String priceDescription;
  final String authorName;
  final String destinationFeedBack;
  final String destinationName;

  Destination(
      {required this.imagePath,
      required this.rating,
      required this.tags,
      required this.priceDescription,
      required this.authorName,
      required this.destinationFeedBack,
      required this.destinationName});
}

class AirBnb {
  final List<String> imagePath;
  final String subText;
  final String headerText;

  final String mainPoint;
  final String subPoint;
  AirBnb(
      {required this.imagePath,
      required this.subText,
      required this.headerText,
      required this.mainPoint,
      required this.subPoint});
}

class PhotoGallery {
  final String headerText;
  final String imagePath;

  PhotoGallery({required this.headerText, required this.imagePath});
}
