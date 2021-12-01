import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/circle_list_model.dart';

class MyCircleList extends StatefulWidget {
  const MyCircleList({Key? key}) : super(key: key);

  @override
  _MyCircleListState createState() => _MyCircleListState();
}

class _MyCircleListState extends State<MyCircleList> {
  String errorMsg = 'No data Found';
  List<CircleListModel>? circleList = [];

  void initState() {
    // TODO: implement initState

    circleApiLoad();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<String> _loadCircleBoard() async {
    return await rootBundle.loadString('assets/JSON/circle_list.json');
  }

  void circleApiLoad() async {
    String jsonString = await _loadCircleBoard();
    final jsonResponce = json.decode(jsonString) as List<dynamic>;
    setState(() {
      circleList =
          jsonResponce.map((e) => CircleListModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: ClipOval(
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'My Circle',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: new Image.asset(
                    'assets/images/Settings.png',
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[850], fontSize: 16),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: circleList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black,
                              child: ClipOval(
                                  child: new Image.network(
                                '${circleList![index].profile}',
                                width: 40,
                                height: 50,
                              ))),
                          title: Text(
                            '${circleList![index].name}',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          subtitle: Text(
                            '${circleList![index].username}',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          trailing: new Image.asset(
                            '${circleList![index].icon}',
                          ),
                        ),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
