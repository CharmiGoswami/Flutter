import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/Leaderboard/leaderboard.dart';
import 'package:flutter_application/MODEL/leader_board_model.dart';
import 'package:flutter_application/app.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView(shrinkWrap: true, children: [
        Column(mainAxisSize: MainAxisSize.max, children: [
          App(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Row(
              children: [
                Text(
                  "Hear are today's actions for you",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 15, 20, 0),
            child: Container(
              child: new Image.asset('assets/images/Group 12.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Text(
                  'Earn Trstos using following ways.',
                  style: TextStyle(color: Colors.amber, fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              children: [
                Container(
                  width: 375,
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 190.0,
                        width: 310.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Build your trust circle.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 190.0,
                        width: 310.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Answer 4 easy questions about your friends.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 190.0,
                        width: 310.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Post a vibe and share feedback on others vibe.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 190.0,
                        width: 310.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Opportunity to build global credibility.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Image.asset('assets/images/3 Items.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Column(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LeaderBoard()));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Image.asset('assets/images/Group 124.png'),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Leader board',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('27 July 2021',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '03',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('/345',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              Text('Rank',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${leaderBoard[index].id}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                      );
                    })
              ]),
            ),
          ),
        ]),
      ]),
    );
  }
}
