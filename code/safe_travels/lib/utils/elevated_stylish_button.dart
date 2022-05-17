import 'package:flutter/material.dart';

class SafeTravelsStylishButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backGroundColor;
  final Color foreGroundColor;
  final double fontSize;
  final String text;
  final bool showArrow;
  final void Function() onPressed;

  @override
  SafeTravelsStylishButton(
      {Key? key,
      this.width = 180.0,
      this.height = 50.0,
      this.fontSize = 28.0,
      this.backGroundColor = Colors.red,
      this.showArrow = false,
      required this.onPressed,
      required this.foreGroundColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
            constraints: BoxConstraints(maxWidth: width, minHeight: height),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: backGroundColor),
              onPressed: () {
                onPressed();
              },
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        color: foreGroundColor,
                      ),
                    ),
                    this.showArrow
                        ? Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ),
            )));
  }
}
