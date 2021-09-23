import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//Custom app bar
class MyBar extends AppBar{
  MyBar({Key? key, required Widget title,Color ?color}):super(key: key,title: title,actions: <Widget>[Icon(Icons.home)]);
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyBar(title: Text('Home'),    
      ),
    );
  }
}