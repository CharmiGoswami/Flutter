import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/new_request_model.dart';
import 'package:flutter_application/MODEL/profile_model.dart';
import 'package:flutter_application/MODEL/vibes_model.dart';
import 'package:flutter_application/Profile/followers.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  ProfileDataModel? profileDataModel;
  bool borderMyCircle = true;
  bool clickMyCircle = true;
  List<VibesModel> vibesModel = [];
  List<NewRequestModel>? newRequestModel = [];

  @override
  void initState() {
    // TODO: implement initState
    loadProfileDataModel();
    vibesModelList();
    newRequest();
    super.initState();
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

  Future<String> _loadProfileModel() async {
    return await rootBundle.loadString('assets/JSON/edit_profile.json');
  }

  void loadProfileDataModel() async {
    String jsonString = await _loadProfileModel();
    final jsonResponce = json.decode(jsonString);
    setState(() {
      profileDataModel = ProfileDataModel.fromJson(jsonResponce);
    });
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
      body: ListView(shrinkWrap: true, children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
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
                  '${profileDataModel!.username}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 12, 20, 0),
                  child: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: new Image.network(
                        '${profileDataModel!.profile}',
                        fit: BoxFit.fill,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Column(
                    children: [
                      new Image.asset(
                        'assets/images/LineLightning.png',
                        width: 30,
                        height: 40,
                      ),
                      Text(
                        '134',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Column(
                    children: [
                      new Image.asset(
                        'assets/images/Followers.png',
                        width: 30,
                        height: 40,
                      ),
                      Text(
                        '321',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      new Image.asset(
                        'assets/images/Following.png',
                        width: 30,
                        height: 40,
                      ),
                      Text(
                        '231',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: [
                  Text(
                    '${profileDataModel!.last_name} ${profileDataModel!.first_name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: [
                  Text(
                    'UI/UX designer | Design problem solver\nUX Researcher | Management Consultant\nThinker | Problem Solver | Hiker',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
              child: Row(
                children: [
                  Text(
                    'Read more',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
                child: Row(
                  children: [
                    new Image.asset(
                      'assets/images/social icons.png',
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 5, 0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            borderMyCircle = !borderMyCircle;
                            clickMyCircle = true;
                          });
                        },
                        icon: new Image.asset(
                          'assets/images/LineLightning.png',
                          width: 19,
                          height: 19,
                        ),
                        label: Text(
                          'Vibes',
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
                      padding: const EdgeInsets.fromLTRB(0, 24, 10, 0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            borderMyCircle = !borderMyCircle;
                            clickMyCircle = false;
                          });
                        },
                        icon: new Image.asset(
                          'assets/images/Followers.png',
                          width: 19,
                          height: 19,
                        ),
                        label: Text(
                          'Followers',
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
                  // Padding(
                  //     padding: const EdgeInsets.fromLTRB(0, 24, 10, 0),
                  //     child: OutlinedButton.icon(
                  //       onPressed: () {
                  //         setState(() {
                  //           borderMyCircle = !borderMyCircle;
                  //           clickMyCircle = false;
                  //         });
                  //       },
                  //       icon: new Image.asset(
                  //         'assets/images/Following.png',
                  //         width: 19,
                  //         height: 19,
                  //       ),
                  //       label: Text(
                  //         'Following',
                  //         style:
                  //             TextStyle(color: Colors.white, fontSize: 16),
                  //       ),
                  //       style: OutlinedButton.styleFrom(
                  //           backgroundColor: Colors.black,
                  //           side: BorderSide(
                  //               color: borderMyCircle
                  //                   ? Colors.black
                  //                   : Colors.white,
                  //               width: 0.9)),
                  //     )),
                  // Padding(
                  //     padding: const EdgeInsets.fromLTRB(0, 24, 20, 0),
                  //     child: InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           borderMyCircle = !borderMyCircle;
                  //           clickMyCircle = false;
                  //         });
                  //       },
                  //       child: InkWell(
                  //         onTap: () {},
                  //         child: Container(
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: new Image.asset(
                  //               'assets/images/Settings.png',
                  //               width: 19,
                  //               height: 19,
                  //             ),
                  //           ),
                  //           decoration: BoxDecoration(
                  //               color: Colors.black,
                  //               borderRadius: BorderRadius.circular(10),
                  //               border: Border.all(
                  //                 color: Colors.white,
                  //               )),
                  //         ),
                  //       ),
                  //     ))
                ],
              ),
            ),
            clickMyCircle == true
                ? Column(
                    children: [
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
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
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
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
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                new Image.asset(
                                                    '${vibesModel[index].icon}')
                                              ],
                                            ),
                                            Text('${vibesModel[index].time}',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              70, 8, 2, 0),
                                          child: Text(
                                              ' ${vibesModel[index].catagory}',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12)),
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
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          )
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
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          Icon(
                                            Icons.thumb_down_alt,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '${vibesModel[index].dislike_number}',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            );
                          })
                    ],
                  )
                : Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 20, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        newRequestModel![index].selected = true;

                                        print(
                                            '${newRequestModel![index].profile}');
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
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      '${newRequestModel![index].username}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                ));
                          }),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Follower()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(120, 10, 0, 5),
                              child: Text(
                                'Find more',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(1, 10, 120, 5),
                              child: Text(
                                '(234)',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
          ],
        )
      ]),
    );
  }
}

class Followers {}
