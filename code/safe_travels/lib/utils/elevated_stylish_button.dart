import 'package:flutter/material.dart';

class SafeTravelsStylishButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backGroundColor;
  final Color foreGroundColor;
  final double fontSize;
  final String text;
  final void Function() onPressed;

  @override
  SafeTravelsStylishButton(
      {Key? key,
      this.width = 130.0,
      this.height = 50.0,
      this.fontSize = 28.0,
      this.backGroundColor = Colors.red,
      required this.onPressed,
      required this.foreGroundColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Container(
          constraints: BoxConstraints(maxWidth: width, minHeight: height),
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: backGroundColor),
            onPressed: () {
              onPressed();
            },
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 15,
                        color: foreGroundColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
