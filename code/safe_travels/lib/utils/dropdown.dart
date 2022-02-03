import 'package:flutter/material.dart';
import 'package:safe_travels/utils/constants.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  double padding = 8;
  String? value = "North America";
  final items = [
    'Africa',
    'Antartica',
    'Asia',
    'Europe',
    'North America',
    'Oceania',
    'South America'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        height: 40,
        padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        decoration: BoxDecoration(
          color: COLOR_BLUE,
          borderRadius: BorderRadius.circular(15),
          //border: Border.all(color: COLOR_BLUE, width: 2)
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          items: items.map(buildMenuItem).toList(),
          value: value,
          iconSize: 36,
          isExpanded: false,
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          onChanged: (value) => onChanged(value),
        )));
  }

  void onChanged(String? s) {
    setState(() => this.value = value);
    }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item, child: Text(item, style: TEXT_THEME_DEFAULT.bodyText1));
}
