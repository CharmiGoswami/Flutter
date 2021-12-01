import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/Profile/profile.dart';

import 'MODEL/profile_model.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String errorMsg = 'No data Found';
  ProfileDataModel? profileData;
  void initState() {
    // TODO: implement initState
    loadProfileEditData();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<String> _loadProfileAssets() async {
    return await rootBundle.loadString('assets/JSON/edit_profile.json');
  }

  void loadProfileEditData() async {
    String jsonString = await _loadProfileAssets();
    final jsonResponce = json.decode(jsonString);
    setState(() {
      profileData = ProfileDataModel.fromJson(jsonResponce);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Row(
        children: [
          Text(
            'Trsto',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '.',
            style: TextStyle(
                color: Colors.red[400],
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  new Image.asset(
                    'assets/images/Filled.png',
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    '234 ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  new Image.asset(
                    'assets/images/IconV3@3x.png',
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    '543 ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  new Image.asset(
                    'assets/images/μ.png',
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    '343 ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 12, 0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewProfile()));
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: new Image.network(
                    '${profileData?.profile}',
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
