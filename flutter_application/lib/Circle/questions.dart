import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/start_scoring_que_model.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List<StartScoringQueModel> startScoringQueModel = [];
  @override
  void initState() {
    // TODO: implement initState

    newRequest();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<String> _loadScoreQue() async {
    return await rootBundle
        .loadString('assets/JSON/start_scoring_questions.json');
  }

  void newRequest() async {
    String jsonString = await _loadScoreQue();
    final jsonResponce = json.decode(jsonString) as List<dynamic>;
    setState(() {
      startScoringQueModel =
          jsonResponce.map((e) => StartScoringQueModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 180,
          width: 335,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: startScoringQueModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${startScoringQueModel[index].que}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${startScoringQueModel[index].btn1}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.4),
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.9)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${startScoringQueModel[index].btn2}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.4),
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.9)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${startScoringQueModel[index].btn3}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.4),
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.9)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${startScoringQueModel[index].btn4}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.4),
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.9)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${startScoringQueModel[index].btn5}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.4),
                                    side: BorderSide(
                                        color: Colors.grey, width: 0.9)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
