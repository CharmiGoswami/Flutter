import 'dart:math';

import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
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
  bool hasScaffoldColor = false;
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    no1 = random.nextInt(10000);
    no2 = random.nextInt(10000);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
            child: hasScaffoldColor == false
                ? ScaleAnimatedWidget.tween(
                    duration: Duration(milliseconds: 600),
                    scaleDisabled: 0.5,
                    scaleEnabled: 1,
                    //your widget
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Center(child: Text(text)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(Random().nextInt(0xffffffff))
                            .withOpacity(0.5),
                      ),
                    ),
                  )
                : ShakeAnimatedWidget(
                    duration: Duration(milliseconds: 1500),
                    shakeAngle: Rotation.deg(z: 40),
                    curve: Curves.linear,
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Center(child: Text(text)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(Random().nextInt(0xffffffff))
                            .withOpacity(0.5),
                      ),
                    )),
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
              //setState(() {
              sum = no1 + no2;
              setState(() {
                if (sum.toString() == text.toString()) {
                  hasScaffoldColor = true;
                } else {
                  hasScaffoldColor = false;
                }
              });

              print(hasScaffoldColor);
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
