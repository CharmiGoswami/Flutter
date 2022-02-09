import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? Color.fromARGB(255, 136, 113, 158) : Color.fromARGB(255, 63, 15, 107),
      body: Center(

          child: lightMode
              ? Icon(Icons.settings)
              : Icon(Icons.settings_applications_sharp)),
    );
  }
}