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
  List<List_class> listclass = listModelData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
          backgroundColor: Colors.blueGrey,
          elevation: 14,
        ),
        body: ListView.builder(
          //length of list
          itemCount: listclass.length,
          itemBuilder: (context, index) => ListTile(
            title: Text("${listclass[index].color_name}"),
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

