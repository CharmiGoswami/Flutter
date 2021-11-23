import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modals/api.dart';

class Image_Load extends StatefulWidget {
  const Image_Load({Key? key}) : super(key: key);

  @override
  _Image_LoadState createState() => _Image_LoadState();
}

class _Image_LoadState extends State<Image_Load> {
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
      appBar: AppBar(
        title: Text('profile'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            child: new Image.network(
              '${api?.profile_pic}',
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
                        fontSize: 40)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${api?.last_name}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
