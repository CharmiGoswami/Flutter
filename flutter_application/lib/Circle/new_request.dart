import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/Circle/circle.dart';
import 'package:flutter_application/Circle/data.dart';
import 'package:flutter_application/Circle/start_scoring.dart';
import 'package:flutter_application/MODEL/new_request_model.dart';

class NewRequest extends StatefulWidget {
  const NewRequest({Key? key}) : super(key: key);

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  String errorMsg = 'No data Found';
  List<NewRequestModel>? newRequestModel = [];

  @override
  void initState() {
    // TODO: implement initState

    newRequest();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<String> _loadNewRequest() async {
    return await rootBundle.loadString('assets/JSON/trsto_universe.json');
  }

  void newRequest() async {
    String jsonString = await _loadNewRequest();
    final jsonResponce = json.decode(jsonString) as List<dynamic>;
    setState(() {
      newRequestModel =
          jsonResponce.map((e) => NewRequestModel.fromJson(e)).toList();
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Circle()));
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
                'New Request',
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
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
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
                itemCount: newRequestModel!.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Dismissible(
                        key: ValueKey<int>(newRequestModel!.length),
                        secondaryBackground: Container(
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
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 19),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.3),
                          ),
                          width: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.greenAccent,
                              ),
                              Text(
                                'Accept',
                                style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            setState(() {
                              newRequestModel!.removeAt(index);
                            });
                          }
                          if (direction == DismissDirection.startToEnd) {
                            setState(() {
                              newRequestModel!.removeAt(index);
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                newRequestModel![index].selected = true;
                                showDialog(
                                    barrierColor: Colors.grey.withOpacity(0.7),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SimpleDialog(
                                          backgroundColor: Colors.black,
                                          title: Text('Add in circle'),
                                          titleTextStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CircleAvatar(
                                                        radius: 20,
                                                        child: ClipOval(
                                                          child:
                                                              new Image.network(
                                                            '${newRequestModel![index].profile}',
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '${newRequestModel![index].name}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                '${newRequestModel![index].username}',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        12)),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 70,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: OutlinedButton(
                                                        onPressed: () {
                                                          showDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return SimpleDialog(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black,
                                                                    title: Text(
                                                                        'Add in circle'),
                                                                    titleTextStyle: TextStyle(
                                                                        fontSize:
                                                                            22,
                                                                        color: Colors
                                                                            .white),
                                                                    children: [
                                                                      Column(
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: CircleAvatar(
                                                                                    radius: 20,
                                                                                    child: ClipOval(
                                                                                      child: new Image.network(
                                                                                        '${newRequestModel![index].profile}',
                                                                                        fit: BoxFit.fill,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          '${newRequestModel![index].name}',
                                                                                          style: TextStyle(color: Colors.white, fontSize: 16),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text('${newRequestModel![index].username}', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                                                                      ],
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                children: [
                                                                                  Text(
                                                                                    'We are what we pretend to be, so we must be careful about what we pretend to be.',
                                                                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () {
                                                                                final data = Data(profile: "${newRequestModel![index].profile}", name: "${newRequestModel![index].name}", username: "${newRequestModel![index].username}");
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) => StartScoring(
                                                                                              data: data,
                                                                                            )));
                                                                              },
                                                                              child: Row(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.pink.withOpacity(0.2)),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          new Image.asset(
                                                                                            'assets/images/Heart.png',
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Text(
                                                                                              'Best',
                                                                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.amber.withOpacity(0.2)),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          new Image.asset(
                                                                                            'assets/images/Star.png',
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Text(
                                                                                              'Close',
                                                                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green.withOpacity(0.2)),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          new Image.asset(
                                                                                            'assets/images/Arrow right square.png',
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: Text(
                                                                                              'Extended',
                                                                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ])
                                                                    ]);
                                                              });
                                                        },
                                                        child: Text('Accept',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white)),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width:
                                                                        0.9)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: OutlinedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('Delete',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white)),
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .red,
                                                                      width:
                                                                          0.9))),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ]);
                                    });
                              });
                              Container(
                                child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.black,
                                    child: ClipOval(
                                        child: new Image.network(
                                      '${newRequestModel![index].profile}',
                                      width: 100,
                                      height: 150,
                                    ))),
                              );
                            },
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.black,
                                child: ClipOval(
                                    child: new Image.network(
                                  '${newRequestModel![index].profile}',
                                  width: 40,
                                  height: 50,
                                ))),
                            title: Text(
                              '${newRequestModel![index].name}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            subtitle: Text(
                              '${newRequestModel![index].username}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
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
