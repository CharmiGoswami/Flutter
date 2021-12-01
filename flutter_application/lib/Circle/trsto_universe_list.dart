import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/trsto_universe_model.dart';

class TrstoUniverseList extends StatefulWidget {
  const TrstoUniverseList({Key? key}) : super(key: key);

  @override
  _TrstoUniverseListState createState() => _TrstoUniverseListState();
}

class _TrstoUniverseListState extends State<TrstoUniverseList> {
  String errorMsg = 'No data Found';
  List<TrstoUniverseModel>? trstoUniverseList = [];

  @override
  void initState() {
    // TODO: implement initState

    trstoUniverseApiLoad();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                'Trsto Universe',
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
                itemCount: trstoUniverseList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Dismissible(
                        key: ValueKey<int>(trstoUniverseList!.length),
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 19),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.3),
                          ),
                          width: 50,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 200,
                              ),
                              Icon(
                                Icons.delete_outlined,
                                color: Colors.redAccent,
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            trstoUniverseList!.removeAt(index);
                          });
                        },
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            subtitle: Text(
                              '${trstoUniverseList![index].username}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            trailing: new Image.asset(
                              '${trstoUniverseList![index].icon}',
                            ),
                          ),
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
