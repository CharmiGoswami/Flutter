import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: lightMode ? Colors.white : Colors.black,
      body: Center(child: lightMode ? Icon(Icons.search) : Icon(Icons.ac_unit)),
    );
  }
}
