import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:safe_travels/utils/models.dart';

import 'constants.dart';

class AirBnbSf extends StatefulWidget {
  final AirBnb airBnb;
  final int index;
  const AirBnbSf({Key? key, required this.airBnb, required this.index})
      : super(key: key);

  @override
  State<AirBnbSf> createState() => _AirBnbSfState();
}

class _AirBnbSfState extends State<AirBnbSf> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    String firstLine =
        "Entire rental unit • ${widget.airBnb.guests} guests • ${widget.airBnb.beds} beds • ${widget.airBnb.baths} bath";
    widget.airBnb.description = widget.airBnb.description.replaceAll("\n", "");
    widget.airBnb.description = widget.airBnb.description.replaceAll("\t", "");
    return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
                child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                    imageUrl: widget.airBnb.imageUrls[0],
                    height: 500,
                    width: 500)),
            Text(
              firstLine,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: TEXT_THEME_DEFAULT.bodyMedium!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            Text(
              widget.airBnb.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: TEXT_THEME_DEFAULT.headline4!.color,
                  fontWeight: TEXT_THEME_DEFAULT.headline4!.fontWeight,
                  fontSize: 10),
            ),
            Text(
              widget.airBnb.description,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: TEXT_THEME_DEFAULT.bodyText1!.color,
                  fontWeight: TEXT_THEME_DEFAULT.bodyText1!.fontWeight,
                  fontSize: 10),
            ),
          ]),
        ));
  }
}
