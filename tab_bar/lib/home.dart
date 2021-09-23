import 'package:drawer/tab1.dart';
import 'package:drawer/tab2.dart';
import 'package:drawer/tab3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [Icon(Icons.menu)],
          backgroundColor: Colors.teal,
          leading: Icon(Icons.home),
          bottom: TabBar(tabs: [
            Container(
              height: 10,
              color: Colors.greenAccent,
            ),
            Container(
              height: 10,
              color: Colors.red,
            ),
            Container(
              height: 10,
              color: Colors.greenAccent,
            ),
            
          ],),
        ),
        body: TabBarView(children: [
          // Container(
          //     height: 10,
          //     color: Colors.greenAccent,
          //   ),
          //   Container(
          //     height: 10,
          //     color: Colors.red,
          //   ),
          //   Container(
          //     height: 10,
          //     color: Colors.greenAccent,
          //   ),

          Tab1(),
          Tab2(),
          Tab3(),
          
        ],),
      ),
    );
  }
}