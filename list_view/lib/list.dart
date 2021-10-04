import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_class.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  bool checkBoxValue = false;
  List_class list_class = new List_class();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
          backgroundColor: Colors.blueGrey,
          elevation: 14,
        ),
        body: ListView.builder(
          itemBuilder: (Listviewcontext, index) => ListTile(
            title: Text(list_class.color_name.toString()),
            onTap: () {},
            trailing: Checkbox(
                autofocus: false,
                activeColor: Colors.blueGrey,
                checkColor: Colors.white,
                value: checkBoxValue,
                onChanged: (bool? newValue) {
                  setState(() {
                    checkBoxValue = newValue!;
                  });
                }),
          ),
        ));
  }
}
