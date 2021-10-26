import 'dart:async';

import 'package:flutter/material.dart';
import 'package:future_builder/stream_builder.dart';

import 'future_builder.dart';

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
      home: Future_Builder(),
    );
  }
}
