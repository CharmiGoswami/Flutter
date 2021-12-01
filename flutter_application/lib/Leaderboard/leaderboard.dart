import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/leader_board_model.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  String errorMsg = 'No data Found';

  List<LeaderBoardModel> leaderBoard = [];
  @override
  void initState() {
    // TODO: implement initState

    leaderBoardApiLoad();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<String> _loadLeaderBoard() async {
    return await rootBundle.loadString('assets/JSON/leader_board.json');
  }

  void leaderBoardApiLoad() async {
    String jsonString = await _loadLeaderBoard();
    final jsonResponce = json.decode(jsonString) as List<dynamic>;
    setState(() {
      leaderBoard =
          jsonResponce.map((e) => LeaderBoardModel.fromJson(e)).toList();
    });
  }

  bool borderMyCircle = true;
  bool clickMyCircle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
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
                  'Leaderboard',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ]),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 3, 0),
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
                                color: borderMyCircle
                                    ? Colors.white
                                    : Colors.black,
                                width: 0.9)),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 3, 0),
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
                                color: borderMyCircle
                                    ? Colors.black
                                    : Colors.white,
                                width: 0.9)),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 14, 0),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.black,
                            barrierColor: Colors.black.withOpacity(0.6),
                            enableDrag: true,
                            isDismissible: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            builder: (_) {
                              return SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Choose Durations',
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: OutlinedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Week',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.6),
                                                  side: BorderSide(
                                                      color: Colors.white,
                                                      width: 0.9)),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: OutlinedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Month',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.6),
                                                ),
                                              )),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: OutlinedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Year',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.6),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
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
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 70, 3, 0),
                    child: Card(
                        color: Colors.blueGrey,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: ClipOval(
                                child: new Image.network(
                                  'https://cdn.fakercloud.com/avatars/iamjdeleon_128.jpg',
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Rosie Muller',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            Text('1134',
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 12))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 3, 0),
                    child: Card(
                        color: Colors.blueGrey,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              child: ClipOval(
                                child: new Image.network(
                                  'https://cdn.fakercloud.com/avatars/souuf_128.jpg',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Ella Harris',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            Text('1234',
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 12))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 4, 0),
                    child: Card(
                        color: Colors.blueGrey,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: ClipOval(
                                child: new Image.network(
                                  'https://cdn.fakercloud.com/avatars/silvanmuhlemann_128.jpg',
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Rudolph Nikolaus',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                            Text('893',
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 12))
                          ],
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text(
                      'Top leaders',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: leaderBoard.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${leaderBoard[index].id}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.black,
                                    child: ClipOval(
                                        child: new Image.network(
                                      '${leaderBoard[index].profile}',
                                      width: 40,
                                      height: 50,
                                    ))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    '${leaderBoard[index].name}',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${leaderBoard[index].coins}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.amber,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
