import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.red,
              ),
              Container(
                height: 800,
                width: double.infinity,
                color: Colors.blue,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      width: double.infinity,
                      height: 600,
                      color: Colors.black,
                    ),
                    Divider(),
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
