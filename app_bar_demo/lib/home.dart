import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,//background
        title: Text('Home'),
        centerTitle: false,
        elevation: 5.0,//Shadow
        leading: Padding(padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_box),
                ),
        actions: [Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.menu),
          )],
          leadingWidth: 2,//width of leading
          shadowColor: Colors.red,
          foregroundColor: Colors.blueGrey,
          titleSpacing: 1,

      ),
    );
  }
}