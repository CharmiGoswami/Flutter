import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrap widget',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Wrap widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Wrap(
        children: [
          Text(' Hi '),
          Text(' Hey '),
          Text(' Hello '),
          Text(' Hola '),
          Text(' Bonjour '),
          Text(' Nice to meet you '),
          Text(' Nice to see you again '),
          Text(' Thank you '),
          Text(' Welcome '),
          Text(' Bye '),
           
        ],
      )
    );
  }
}
