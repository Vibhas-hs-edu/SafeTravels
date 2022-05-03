import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  final IconData icon;
  final void Function() onPressed;

  const IconButtonWidget(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 25,
      icon: Icon(widget.icon),
      tooltip: 'Increase volume by 10',
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}
