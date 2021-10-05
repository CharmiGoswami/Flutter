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
  List userChecked = [];

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
          itemBuilder: (context, index) {
            var listname = listclass[index].color_name;
            return CheckboxListTile(
              selected: false,
              title: Text('${listclass[index].color_name}'),
              value: checkBoxValue,
              onChanged: (value) {
                setState(() {
                  checkBoxValue = value!;
                });
                controlAffinity:
                ListTileControlAffinity.leading;
              },
            );
          }),
    );
  }
}
