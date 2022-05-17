import 'package:flutter/material.dart';
import 'package:safe_travels/utils/models.dart';

class TripAdvisorSf extends StatefulWidget {
  final Destination destination;
  final int index;
  const TripAdvisorSf(
      {Key? key, required this.destination, required this.index})
      : super(key: key);

  @override
  State<TripAdvisorSf> createState() => _TripAdvisorSfState();
}

class _TripAdvisorSfState extends State<TripAdvisorSf> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    String destinationNameFormatted =
        "${widget.index + 1}. ${widget.destination.destinationName}";
    String tagsFormatted = "";
    for (var i = 0; i < widget.destination.tags.length; i++) {
      var tag = widget.destination.tags[i];
      tagsFormatted += tag;
      if (i != widget.destination.tags.length - 1) {
        tagsFormatted += "\u2022";
        tagsFormatted += " ";
      }
    }
    return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
                child: Image.network(widget.destination.imagePath, width: 300)),
            Text(destinationNameFormatted, textAlign: TextAlign.left)
            //Text(tagsFormatted, textAlign: TextAlign.left)
            //Text(widget.destination.priceDescription),
            //Text("User : " + widget.destination.authorName),
            //Text(widget.destination.destinationFeedBack,
            //textAlign: TextAlign.center)
          ]),
        ));
  }
}
