import 'package:flutter/material.dart';
import 'package:safe_travels/utils/constants.dart';
import 'package:safe_travels/utils/models.dart';

class CheckBoxSf extends StatefulWidget {
  final ImageAttributes imageAttributes;
  const CheckBoxSf({Key? key, required this.imageAttributes}) : super(key: key);

  @override
  State<CheckBoxSf> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxSf> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return COLOR_BLUE_PANTONE;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: widget.imageAttributes.isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.imageAttributes.isChecked = isChecked;
        });
      },
    );
  }
}
