import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  var _scaffoldkey= GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Home'),
        actions: [Icon(Icons.menu)],
        backgroundColor: Colors.teal,
        leading: Icon(Icons.home),
      ),
      
      // drawer: Container(
      //   color: Colors.blueGrey,
      //   width: MediaQuery.of(context).size.width*0.2,
      // ),
      endDrawer:DrawerClass() ,
      drawer: DrawerClass(),
      body: InkWell(
        onTap: (){
          _scaffoldkey.currentState?.openDrawer();
        // _scaffoldkey.currentState?.openEndDrawer();
        },
        child: Center(
            child:Icon(Icons.bubble_chart),
          ),
      ),
    );
    
  }
}

class DrawerClass extends StatelessWidget {
  const DrawerClass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: [
      SizedBox(
        height: 55,
      ),
      Container(
        color: Colors.red,
        height: 50,
      ),
      SizedBox(
        height: 55,
      ),
      Container(
        color: Colors.teal,
        height: 50,
      ),
      SizedBox(
        height: 55,
      ),
      Container(
        color: Colors.red,
        height: 50,
      ),
    ],),);
  }
}