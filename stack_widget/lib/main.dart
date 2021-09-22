import 'dart:math';

import 'package:flutter/cupertino.dart';
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
      title: 'Stack widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Stack widget'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 600,
              width: 300,
            ),
            Positioned(
              top:2,
              right:2,
              child: Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              )),
              Positioned(
              top:30,
              right:48,
              child: Container(
                color: Colors.pink,
                height: 70,
                width: 70,
              )),
              Positioned(
              top:75,
              right:110,
              child: Container(
                color: Colors.black,
                height: 100,
                width: 50,
              )),
              Positioned(
              top:150,
              right:160,
              child: Container(
                color: Colors.blue,
                height: 60,
                width: 80,
              )),
              Positioned(
              top:190,
              left: 2,
              child: Container(
                color: Colors.pink,
                height: 60,
                width: 80,
              )),
              Positioned(
              top:250,
              left:73,
              child: Container(
                color: Colors.black,
                height: 60,
                width: 50,
              )),
              Positioned(
              top:305,
              left:120,
              child: Container(
                color: Colors.blue,
                height: 60,
                width: 50,
              )),
              Positioned(
              top:345,
              left:150,
              child: Container(
                color: Colors.pink,
                height: 70,
                width: 60,
              )),
              Positioned(
              top:385,
              left:200,
              child: Container(
                color: Colors.black,
                height: 60,
                width: 114,
              )),
              Positioned(
              top:470,
              left:0,
              right:0,
              child: Container(
                alignment: Alignment.center,
                child: Text('Charmi Goswami'),
                color: Colors.grey,
                height: 100,
                width: 300,
              )),
          ],
        ),
      )
          );
  }
}
