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
    var materialApp3 = MaterialApp(
      title: 'Row and Column',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Row and Column'),
    );
    var materialApp2 = materialApp3;
    var materialApp = materialApp2;
    return materialApp;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Icon(Icons.home,size: 20,),
            Icon(Icons.favorite,size:20),
          ],),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Icon(Icons.camera,size: 20,),
            Icon(Icons.picture_in_picture,size:20),
            Icon(Icons.edit),
          ],),
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Icon(Icons.zoom_in,size: 20,),
            Icon(Icons.zoom_out,size:20),
          ],),
          Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         verticalDirection: VerticalDirection.up,
          children:[
            Text('Charmi',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30)),
            Text(' '),
            Text(' ')
          ],),
          Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Text(' '),
            Text('Charmi',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30)),
            Text('Goswami',style:TextStyle(fontStyle: FontStyle.italic,color: Colors.red))
          ],),
          Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Text(' '),
            Text('Charmi',style:TextStyle(fontStyle: FontStyle.italic,color: Colors.blue)),
            Text('Goswami',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 30))
          ],),
          Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         verticalDirection: VerticalDirection.down,
          children:[
            Text(' '),
            Text(' '),
            Text('Charmi',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 30)),
          ],),
      ],),
    );
  }
}
