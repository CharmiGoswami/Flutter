import 'package:flutter/material.dart';
import 'package:flutter_application/Forgot_password/forgot_password.dart';
import 'package:flutter_application/Remember_user/enter_password.dart';
import 'package:flutter_application/Remember_user/login_remember.dart';

import 'Add_Circle/add_in_circle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddInCircle(),
    );
  }
}

