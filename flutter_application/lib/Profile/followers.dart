import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/new_request_model.dart';
import 'package:flutter_application/MODEL/profile_model.dart';

class Follower extends StatefulWidget {
  const Follower({Key? key}) : super(key: key);

  @override
  _FollowerState createState() => _FollowerState();
}

class _FollowerState extends State<Follower> {
  String errorMsg = 'No data Found';
  List<NewRequestModel>? newRequestModel = [];
  ProfileDataModel? profileDataModel;

  @override
  void initState() {
    // TODO: implement initState

    newRequest();
    loadProfileDataModel();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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

                                print('${newRequestModel![index].profile}');
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
