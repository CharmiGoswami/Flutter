import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: lightMode ? Colors.white : Colors.black,
      body: Center(
          child: lightMode
              ? Image.asset(
                  'assets/images/splash.gif',
                  height: 200,
                  width: 200,
                )
              : Image.asset(
                  'assets/images/splash.gif',
                  height: 200,
                  width: 200,
                )),
    );
  }
}
