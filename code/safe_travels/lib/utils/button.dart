import 'package:flutter/material.dart';

class SafeTravelsButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backGroundColor;
  final Color foreGroundColor;
  final double fontSize;
  final String text;
  final void Function() onPressed;

  @override
  SafeTravelsButton(
      {Key? key,
      this.width = 280.0,
      this.height = 80.0,
      this.fontSize = 28.0,
      required this.onPressed,
      required this.backGroundColor,
      required this.foreGroundColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(this.width, this.height),
          textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          primary: this.backGroundColor, //background
          onPrimary: this.foreGroundColor,
          side: BorderSide(width: 1, color: Colors.black)
          //onPrimary: this.foreGroundColor //Foreground
          ),
      child: Text(this.text),
      onPressed: () => {
        print('Hello')
      },
    );
  }
}
