import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'image.dart';
import 'modals/api.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  API? api;

  void initState() {
    loadAPI();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Future<String> _loadAPIAssets() async {
    return await rootBundle.loadString('assets/api.json');
  }

  Future loadAPI() async {
    //get data from assets
    String jsonString = await _loadAPIAssets();
    final jsonResponce = json.decode(jsonString);
    setState(() {
      api = API.fromJson(jsonResponce);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: new Image.network(
              "${api?.profile_pic}",
              width: double.infinity,
              height: 500,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Arena',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${api?.last_name}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Image_Load(),
                      ));
                },
                child: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.black,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${api?.bio}',
              style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '${api?.post}\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    TextSpan(
                        text: 'Post',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '${api?.followers}\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    TextSpan(
                        text: 'Followers',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '${api?.following}\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    TextSpan(
                        text: 'Following',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
