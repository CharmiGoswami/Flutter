import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Circle/circle.dart';

import 'package:flutter_application/Circle/data.dart';
import 'package:flutter_application/Circle/new_request.dart';
import 'package:flutter_application/Circle/questions.dart';

class StartScoring extends StatelessWidget {
  const StartScoring({Key? key, required this.data}) : super(key: key);
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
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
                      MaterialPageRoute(builder: (context) => NewRequest()));
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
              'Start scoring',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 15, 20, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Circle()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            )
          ]),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
                child: CircleAvatar(
                  radius: 40,
                  child: ClipOval(
                    child: new Image.network(
                      '${data.profile}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                child: Column(
                  children: [
                    Text(
                      '${data.name}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${data.username}',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
            child: Center(
              child: Text(
                'You answer will inpact the trst scrore μ, take your',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 20, 0),
            child: Center(
              child: Text(
                'best and honest shot, and help each other',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 3, 20, 0),
            child: Center(
              child: Text(
                'creating a global trsted world!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
            child: Center(
                child: Text(
              'Question 1/4',
              style: TextStyle(color: Colors.amber, fontSize: 20),
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(
              children: [
                Questions(),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                child: ButtonSubmit(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ButtonSubmit extends StatefulWidget {
  const ButtonSubmit({Key? key}) : super(key: key);

  @override
  _ButtonSubmitState createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 335,
        child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierColor: Colors.white.withOpacity(0.2),
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        backgroundColor: Colors.black,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hurray!'),
                        ),
                        titleTextStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Yow earned',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Image.asset(
                                      'assets/images/IconV3@3x.png',
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  Text('24',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('total coins are 100',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'I want more coins',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NewRequest()));
                                    },
                                    child: Text(
                                      'Will come back later for more',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    )),
                              )
                            ],
                          )
                        ],
                      );
                    });
              });
            }));
  }
}
