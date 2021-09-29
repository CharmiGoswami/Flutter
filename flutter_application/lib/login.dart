import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  'Welcome, world awaits your ',
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                child: TextFormField(
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black54,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19)),
                )),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                child: TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black54,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19)),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: new Image.asset(
                  'assets/images/Exclude.png',
                  width: 15,
                  height: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 15, 0, 0),
                child: Text(
                  'Remember',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 15, 0, 0),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                child: MaterialButton(
                  height: 53,
                  minWidth: 340,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12)),
                  onPressed: () {},
                  child: Text(
                    "Login",
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
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(105, 90, 2, 0),
                    child: Text(
                      'New at Trsto ?',
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 90, 2, 0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: Colors.amber),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}