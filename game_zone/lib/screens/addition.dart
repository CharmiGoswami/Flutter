import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class Addition extends StatefulWidget {
  const Addition({Key? key}) : super(key: key);

  @override
  _AdditionState createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  Random random = new Random();
  late int no1, no2, sum;
  String text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    no1 = random.nextInt(10000);
    no2 = random.nextInt(10000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Container(
                  child: Text('$no1'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(0.4),
                    radius: 20,
                    child: Container(
                        child: Icon(
                      Icons.add,
                      size: 40,
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Container(
                  child: Text('$no2'),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 30, bottom: 10),
            child: Text(text),
          ),
          NumericKeyboard(
            onKeyboardTap: _onKeyboardTap,
            textColor: Colors.blue,
            rightButtonFn: () {
              setState(() {
                text = text.substring(0, text.length - 1);
              });
            },
            rightIcon: Icon(
              Icons.backspace,
              color: Colors.red,
            ),
            leftButtonFn: () {
              print('${no1 + no2}');
              setState(() {
                sum = no1 + no2;
                //if (text == no1 + no2) {
                AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  title: Text('Right'),
                  content: Container(),
                );
                // } else {
                //   AlertDialog(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(15))),
                //     title: Text('Opps! Wrong Answer'),
                //     content: Container(),
                //   );
                // }
              });
            },
            leftIcon: Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }
}
