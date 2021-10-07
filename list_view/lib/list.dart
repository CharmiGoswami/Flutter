import 'dart:convert';

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
  List<Listclass> listclass = [
    Listclass(color_name: 'Blue', checked: false),
    Listclass(color_name: 'Yellow', checked: false),
    Listclass(color_name: 'Black', checked: false),
    Listclass(color_name: 'Red', checked: false),
    Listclass(color_name: 'Pink', checked: false),
    Listclass(color_name: 'Purple', checked: false),
    Listclass(color_name: 'Brown', checked: false),
    Listclass(color_name: 'Grey', checked: false),
    Listclass(color_name: 'Green', checked: false),
    Listclass(color_name: 'Blue', checked: false),
    Listclass(color_name: 'Yellow', checked: false),
    Listclass(color_name: 'Black', checked: false),
    Listclass(color_name: 'Red', checked: false),
    Listclass(color_name: 'Pink', checked: false),
    Listclass(color_name: 'Purple', checked: false),
    Listclass(color_name: 'Brown', checked: false),
    Listclass(color_name: 'Grey', checked: false),
    Listclass(color_name: 'Green', checked: false),
  ]; //=listModelData();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        backgroundColor: Colors.blueGrey,
        elevation: 14,
      ),
      body: ListView.builder(
          itemCount: listclass.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
                selected: true,
                title: Text('${listclass[index].color_name}'),
                value: listclass[index].checked,
                onChanged: (value) {
                  setState(() {
                    listclass[index].checked = value!;
                  });
                });
          }),
    );
  }
}

class Listclass {
  final String? color_name;
  bool checked;

  Listclass({this.color_name, required this.checked});
}
