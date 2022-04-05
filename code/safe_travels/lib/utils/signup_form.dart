import 'package:flutter/material.dart';
import 'package:safe_travels/screens/maincontent_screen.dart';
import 'package:safe_travels/utils/constants.dart';

import '../screens/countries_screen.dart';
import 'button.dart';

// Define a custom Form widget.
class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignupFormState extends State<SignupForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return null;
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email address',
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w100)))),
          SafeTravelsButton(
            width: 343,
            height: 52,
            backGroundColor: Colors.white,
            foreGroundColor: COLOR_BLACK,
            text: "Sign Up",
            onPressed: () => {
              if (_formKey.currentState!.validate())
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainContentScreen()),
                  )
                }
            },
          )
        ],
      ),
    );
  }
}
