import 'package:flutter/material.dart';

class TextButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: TextButton(
          //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
          autofocus: true,
          //Called when the button is tapped or otherwise activated.
          onPressed: () {
            // ignore: avoid_print
            print("Press");
          },
          //Customizes this button's appearance
          style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal.withOpacity(0.7),
              onSurface: Colors.grey,
              shadowColor: Colors.grey,
              elevation: 5,
              side: const BorderSide(color: Colors.white, width: 2),
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              textStyle: const TextStyle(
                color: Colors.green,
                fontSize: 50,
                fontStyle: FontStyle.italic,
              )),

          //Typically the button's label.
          child: const Text("Text Button"),
        ),
      ),
    );
  }
}
