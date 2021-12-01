import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/notification_model.dart';
import 'package:flutter_application/app.dart';

import '../bottom_navigation_bar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notification_Model> notificationModel = [];

  @override
  void initState() {
    // TODO: implement initState
    NotificationAPIload();
    super.initState();
  }

  Future<String> _loadNotificationModel() async {
    return await rootBundle.loadString('assets/JSON/notification.json');
  }

  void NotificationAPIload() async {
    String jsonString = await _loadNotificationModel();
    final jsonResponce = json.decode(jsonString) as List<dynamic>;

    setState(() {
      notificationModel =
          jsonResponce.map((e) => Notification_Model.fromJson(e)).toList();
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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              App(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: notificationModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.1)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Colors.blue,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 3, 8),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black,
                                  child: ClipOval(
                                    child: new Image.asset(
                                      '${notificationModel[index].profile}',
                                      width: 70,
                                      height: 90,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 8, 5, 3),
                                    child: Text(
                                      '${notificationModel[index].name}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 3),
                                    child: RichText(
                                        text: TextSpan(
                                            text:
                                                '${notificationModel[index].status}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                            children: [
                                          TextSpan(
                                              text:
                                                  '${notificationModel[index].message}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14))
                                        ])),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 3),
                                    child: Text('9 Jul 201, 11:34PM',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              BottomNavigation()
            ],
          )
        ],
      ),
    );
  }
}
