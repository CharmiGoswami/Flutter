import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/Circle/my_circle_list.dart';
import 'package:flutter_application/Circle/new_request.dart';
import 'package:flutter_application/Circle/trsto_universe_list.dart';
import 'package:flutter_application/MODEL/circle_list_model.dart';
import 'package:flutter_application/MODEL/trsto_universe_model.dart';
import 'package:flutter_application/app.dart';

class Circle extends StatefulWidget {
  const Circle({Key? key}) : super(key: key);

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  String errorMsg = 'No data Found';

  bool borderMyCircle = true;
  bool clickMyCircle = true;

  List<CircleListModel>? circleList = [];
  List<TrstoUniverseModel>? trstoUniverseList = [];
  @override
  void initState() {
    // TODO: implement initState

    circleApiLoad();
    trstoUniverseApiLoad();
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

  Future<String> _loadTrstoUniverseBoard() async {
    return await rootBundle.loadString('assets/JSON/trsto_universe.json');
  }

  void trstoUniverseApiLoad() async {
    String jsonString = await _loadTrstoUniverseBoard();
    final jsonResponce = json.decode(jsonString) as List<dynamic>;
    setState(() {
      trstoUniverseList =
          jsonResponce.map((e) => TrstoUniverseModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView(shrinkWrap: true, children: [
          Column(mainAxisSize: MainAxisSize.max, children: [
            App(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 8, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.6)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Image.asset(
                            'assets/images/half circle 9.png',
                            width: 90,
                            height: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: new Image.asset('assets/images/best.png'),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 8, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.6)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Image.asset(
                            'assets/images/half circle 26.png',
                            width: 90,
                            height: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: new Image.asset('assets/images/close.png'),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.6)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Image.asset(
                            'assets/images/half circle 234.png',
                            width: 90,
                            height: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: new Image.asset('assets/images/extended.png'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewRequest()));
                },
                child: Container(
                  child: new Image.asset(
                    'assets/images/Group 19.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 60,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 5, 0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          borderMyCircle = !borderMyCircle;
                          clickMyCircle = true;
                        });
                      },
                      icon: new Image.asset(
                        'assets/images/Filled.png',
                        width: 19,
                        height: 19,
                      ),
                      label: Text(
                        'My Circle',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide(
                              color:
                                  borderMyCircle ? Colors.white : Colors.black,
                              width: 0.9)),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 10, 0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          borderMyCircle = !borderMyCircle;
                          clickMyCircle = false;
                        });
                      },
                      icon: new Image.asset(
                        'assets/images/Line.png',
                        width: 19,
                        height: 19,
                      ),
                      label: Text(
                        'Trsto Universe',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide(
                              color:
                                  borderMyCircle ? Colors.black : Colors.white,
                              width: 0.9)),
                    ))
              ],
            ),
            if (circleList!.isEmpty || trstoUniverseList!.isEmpty)
              noData()
            else
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 3),
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
                        hintStyle:
                            TextStyle(color: Colors.grey[850], fontSize: 16),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  if (clickMyCircle == true) myCircle() else trstoUniverse(),
                  if (clickMyCircle == true)
                    myCircleFullList()
                  else
                    trustoUniverseFullList(),
                ],
              )
          ])
        ]));
  }

  InkWell myCircleFullList() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyCircleList()));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 10, 0, 5),
            child: Text(
              'Find more',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 10, 120, 5),
            child: Text(
              '(234)',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  InkWell trustoUniverseFullList() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TrstoUniverseList()));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 10, 0, 5),
            child: Text(
              'Find more',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 10, 120, 5),
            child: Text(
              '(234)',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  ListView myCircle() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
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
        });
  }

  ListView trstoUniverse() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
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
                        '${trstoUniverseList![index].profile}',
                        width: 40,
                        height: 50,
                      ))),
                  title: Text(
                    '${trstoUniverseList![index].name}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  subtitle: Text(
                    '${trstoUniverseList![index].username}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  trailing: new Image.asset(
                    '${trstoUniverseList![index].icon}',
                  ),
                ),
              ));
        });
  }

  Column noData() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset('assets/images/Bitmap.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('No buddy in my circle',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Start looking for friend',
            style: TextStyle(color: Colors.amber, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
