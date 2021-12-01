import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/vibes_model.dart';
import 'package:flutter_application/app.dart';
import 'package:flutter_application/bottom_navigation_bar.dart';

class Vibes extends StatefulWidget {
  const Vibes({Key? key}) : super(key: key);

  @override
  _VibesState createState() => _VibesState();
}

class _VibesState extends State<Vibes> {
  bool borderMyCircle = true;
  bool clickMyCircle = true;

  List<VibesModel> vibesModel = [];

  @override
  void initState() {
    // TODO: implement initState
    vibesModelList();
    super.initState();
  }

  Future<String> _loadVibesModel() async {
    return await rootBundle.loadString('assets/JSON/vibes.json');
  }

  void vibesModelList() async {
    String jsonString = await _loadVibesModel();
    final jsonResponse = json.decode(jsonString) as List<dynamic>;
    setState(() {
      vibesModel = jsonResponse.map((e) => VibesModel.fromJSON(e)).toList();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(mainAxisSize: MainAxisSize.max, children: [
              App(),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 8, 0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            borderMyCircle = !borderMyCircle;
                            clickMyCircle = true;
                          });
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                new Image.asset(
                                  'assets/images/Filled.png',
                                  width: 19,
                                  height: 19,
                                ),
                                Text(
                                  ' My Circle',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: borderMyCircle
                                    ? Colors.white
                                    : Colors.black,
                              )),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 8, 0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            borderMyCircle = !borderMyCircle;
                            clickMyCircle = false;
                          });
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                new Image.asset(
                                  'assets/images/Line.png',
                                  width: 19,
                                  height: 19,
                                ),
                                Text(
                                  ' Trsto Universe',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: borderMyCircle
                                    ? Colors.black
                                    : Colors.white,
                              )),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 20, 0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            borderMyCircle = !borderMyCircle;
                            clickMyCircle = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            settingModalBottomSheetShow(context);
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Image.asset(
                                'assets/images/Settings.png',
                                width: 19,
                                height: 19,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 8, 0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Arts ',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Image.asset(
                            'assets/images/Close_cancle.png',
                            width: 15,
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Business ',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Image.asset(
                            'assets/images/Close_cancle.png',
                            width: 15,
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              if (clickMyCircle == true)
                myCircleVibes()
              else
                trstoUniverseVibes()
            ]),
            BottomNavigation()
          ],
        ));
  }

  Future<dynamic> settingModalBottomSheetShow(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.black,
        barrierColor: Colors.black.withOpacity(0.6),
        enableDrag: false,
        isDismissible: false,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (_) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Text(
                        'Choose Catagory',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Business',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(0.6),
                              side:
                                  BorderSide(color: Colors.white, width: 0.9)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Art',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(0.6),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Technology',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(0.6),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Health n wellness',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey.withOpacity(0.6),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Fitness',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(0.6),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Text(
                        'Choose Audience',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Circle',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(0.6),
                              side:
                                  BorderSide(color: Colors.white, width: 0.9)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'Followers',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(0.6),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                )
              ],
            ),
          );
        });
  }

  ListView trstoUniverseVibes() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: vibesModel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Dismissible(
              key: ValueKey<int>(vibesModel.length),
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 19),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.3),
                ),
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Report',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  vibesModel.removeAt(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          child: ClipOval(
                            child: new Image.network(
                                '${vibesModel[index].profile}'),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${vibesModel[index].name} ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              new Image.asset('${vibesModel[index].icon}')
                            ],
                          ),
                          Text('${vibesModel[index].time}',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 8, 2, 0),
                        child: Text(' ${vibesModel[index].catagory}',
                            style: TextStyle(color: Colors.blue, fontSize: 12)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 290,
                          height: 40,
                          child: Text(
                            '${vibesModel[index].message}',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (vibesModel[index].image != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              width: 318,
                              child: new Image.network(
                                '${vibesModel[index].image}',
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        new Image.asset(
                          '${vibesModel[index].icon_thumb_up}',
                          height: 15,
                        ),
                        Text(
                          '${vibesModel[index].like_number}  ',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Icon(
                          Icons.thumb_down_alt,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          '${vibesModel[index].dislike_number}',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          );
        });
  }

  ListView myCircleVibes() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: vibesModel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Dismissible(
              key: ValueKey<int>(vibesModel.length),
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 19),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.3),
                ),
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  vibesModel.removeAt(index);
                });
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 20,
                              child: ClipOval(
                                child: new Image.network(
                                    '${vibesModel[index].profile}'),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${vibesModel[index].name} ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  new Image.asset('${vibesModel[index].icon}')
                                ],
                              ),
                              Text('${vibesModel[index].time}',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 8, 2, 0),
                            child: Text(' ${vibesModel[index].catagory}',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 12)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 290,
                              height: 40,
                              child: Text(
                                '${vibesModel[index].message}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (vibesModel[index].image != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  width: 318,
                                  child: new Image.network(
                                    '${vibesModel[index].image}',
                                    fit: BoxFit.fill,
                                  ))
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            new Image.asset(
                              '${vibesModel[index].icon_clock}',
                              height: 15,
                            ),
                            Text(
                              '${vibesModel[index].clock_time}  ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            new Image.asset(
                              '${vibesModel[index].icon_thumb_up}',
                              height: 15,
                            ),
                            Text(
                              '${vibesModel[index].like_number}  ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Icon(
                              Icons.thumb_down_alt,
                              size: 15,
                              color: Colors.white,
                            ),
                            Text(
                              '${vibesModel[index].dislike_number}',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            new Image.asset(
                              '${vibesModel[index].thumb_like}',
                              height: 40,
                            ),
                            Text(
                              '${vibesModel[index].like_text}  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            new Icon(
                              Icons.thumb_down_alt,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              '  ${vibesModel[index].dislike_text}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  if (vibesModel[index].audio != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: ClipOval(
                                      child: new Image.network(
                                          '${vibesModel[index].profile}'),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${vibesModel[index].name} ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        new Image.asset(
                                            '${vibesModel[index].icon}')
                                      ],
                                    ),
                                    Text('${vibesModel[index].time}',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      '${vibesModel[index].icon_play}'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          );
        });
  }
}
