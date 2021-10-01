import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  bool checkBoxValue = false;
  List<String> items = List.generate(1000, (index) => '$index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
          backgroundColor: Colors.blueGrey,
          elevation: 14,
        ),
        body: ListView.builder(itemBuilder: Listview));
  }

  Widget Listview(context, index) => ListTile(
        title: Text(items[index]),
        onTap: () {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(index.toString())));
        },
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
      );
}
