import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AddInCircle extends StatefulWidget {
  const AddInCircle({ Key? key }) : super(key: key);

  @override
  _AddInCircleState createState() => _AddInCircleState();
}

class _AddInCircleState extends State<AddInCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(child: Text('Click me to add in circle'),onPressed: (){
        showDialog(
          context: context,
          builder: (BuildContext context){
          return SimpleDialog(backgroundColor: Colors.black,
          title: Text('Add in circle',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20,child: ClipOval(child: new Image.network('https://cdn.fakercloud.com/avatars/petrangr_128.jpg',width: 40,height: 40,)))
              ],
            )
          ],
          );
          }
        );
      },),
    );
  }
}