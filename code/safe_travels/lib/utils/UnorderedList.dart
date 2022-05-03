import 'package:flutter/material.dart';
import 'package:safe_travels/utils/constants.dart';

class UnorderedList extends StatelessWidget {
  UnorderedList(this.headerTexts, this.texts);
  final List<String> headerTexts;
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    var n = texts.length;
    for (var i = 0; i < n; i++) {
      // Add list item
      if (headerTexts.length > i) {
        var headerText = headerTexts[i];
        widgetList.add(
            UnorderedListItem(text: headerText, fontWeight: FontWeight.bold));
        // Add space between items
        widgetList.add(SizedBox(height: 1.0));
        //Add sub text
        widgetList.add(Padding(
            padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
            child: Text(texts[i],
                style: TextStyle(
                    fontWeight: TEXT_THEME_DEFAULT.bodyText2!.fontWeight!))));
      } else {
        widgetList.add(UnorderedListItem(
            text: texts[i],
            fontWeight: TEXT_THEME_DEFAULT.bodyText2!.fontWeight!));
        widgetList.add(SizedBox(height: 1.0));
      }
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem({required this.text, this.fontWeight = FontWeight.bold});
  final String text;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(" • ",
            style: TextStyle(color: COLOR_BLACK, fontWeight: fontWeight)),
        Expanded(
          child: Text(text,
              style: TextStyle(color: COLOR_BLACK, fontWeight: fontWeight)),
        ),
      ],
    );
  }
}
