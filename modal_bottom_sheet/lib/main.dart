import 'package:flutter/material.dart';
import 'package:flutter_application_3/cupertino_action_sheet.dart';
import 'package:flutter_application_3/modal_bottom.dart';

import 'draggable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Modal_Buttom(),
    );
  }
}
