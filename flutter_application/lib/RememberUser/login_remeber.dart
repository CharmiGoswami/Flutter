import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/RememberUser/enter_password.dart';
import 'package:flutter_application/register.dart';

// ignore: camel_case_types
class Login_Remember extends StatefulWidget {
  const Login_Remember({Key? key}) : super(key: key);

  @override
  _Login_RememberState createState() => _Login_RememberState();
}

// ignore: camel_case_types
class _Login_RememberState extends State<Login_Remember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                child: new Image.asset(
                  'assets/images/IconV3@3x.png',
                  height: 80,
                  width: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 100, 0, 0),
                child: Text(
                  'Trsto',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 100, 0, 0),
                child: Text(
                  '.',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 0, 0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 0, 2),
                child: Text(
                  'Welcome, world await your ',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'amazing vibes',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 10, 0),
                child: CircleAvatar(
                  radius: 40,
                  child: ClipOval(
                      child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOOlvCzpMQub0HxfCNcjIYmDwm2Nc6glVoBg&usqp=CAU',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EnterPassword()));
                },
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Elena Gilbert',
                      style: TextStyle(color: Colors.amber, fontSize: 20),
                    ),
                    Text(
                      'elena_123',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 8, 20, 0),
                child: Container(
                    color: Colors.white.withOpacity(0.3),
                    child: new Image.asset(
                      'assets/images/Close_cancle.png',
                      fit: BoxFit.fill,
                    )),
              )
            ],
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                child: Container(
                    color: Colors.white.withOpacity(0.3),
                    child: new Image.asset(
                      'assets/images/Plus.png',
                      fit: BoxFit.fill,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Login into another account',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: MaterialButton(
                  height: 53,
                  minWidth: 340,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "Create a account",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
