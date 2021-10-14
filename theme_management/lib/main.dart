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
      themeMode: ThemeMode.light, //dark,light
      darkTheme: ThemeData(primaryColor: Colors.black26),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.amber,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        textTheme: TextTheme(bodyText1: TextStyle(fontSize: 30)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.pink,
          selectedItemColor: Colors.blue,
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            disabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple))),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              enabled: true,
              //false then disable border property worked
              //else enable and focus border property execute
              style: TextStyle(color: Colors.green),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dark_mode), label: 'Dark'),
          BottomNavigationBarItem(icon: Icon(Icons.light_mode), label: 'Light')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
