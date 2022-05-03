import 'package:flutter/material.dart';

import 'package:safe_travels/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;
  final double radius;

  const BorderBox(
      {Key? key,
      this.padding = const EdgeInsets.all(8.0),
      this.radius = 15,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: COLOR_WHITE,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
      padding: padding,
      child: Center(child: child),
    );
  }
}
