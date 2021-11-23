import 'dart:convert';

import 'modals/api2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class List_API extends StatefulWidget {
  const List_API({Key? key}) : super(key: key);

  @override
  _List_APIState createState() => _List_APIState();
}

class _List_APIState extends State<List_API> {
  List<API_List> api = [];

  void initState() {
    loadAPI_List();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Future<String> _loadAPIAssets() async {
    return await rootBundle.loadString('assets/api2.json');
  }

  Future loadAPI_List() async {
    String jsonString = await _loadAPIAssets();
    final jsonResponce = json.decode(jsonString) as List<dynamic>;

    setState(() {
      api = jsonResponce.map((e) => API_List.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: api.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title:
                      Text('${api[index].first_name} ${api[index].last_name}'),
                  subtitle: Text('${api[index].username}'),
                  trailing: Text('${api[index].total_coin}'),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    child: ClipOval(
                        child: api[index].profile_pic == null
                            ? new Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8g7prCGutnZOt2BgiSGEmjg5CkL3H_bcFHvI8T0S1-wc5Et9ZxU95nn44ZaT4vQrUdYg&usqp=CAU',
                                fit: BoxFit.fill,
                                width: 50,
                                height: 70,
                              )
                            : new Image.network(
                                '${api[index].profile_pic}',
                                fit: BoxFit.fill,
                                width: 50,
                                height: 70,
                              )),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            '${api[index].first_name} ${api[index].last_name}')));
                  },
                  onLongPress: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title: Text(
                                  'Username: ${api[index].username}\nName: ${api[index].first_name} ${api[index].last_name}\nTotal coins: ${api[index].total_coin}'),
                              actions: [
                                CupertinoContextMenuAction(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoContextMenuAction(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                ));
          }),
    );
  }
}
