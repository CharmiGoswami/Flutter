import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/ForgotPassword/forgot_password.dart';
import 'package:flutter_application/RememberUser/login_remeber.dart';
import 'package:flutter_application/bottom_navigation_bar.dart';
import 'package:flutter_application/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late FocusNode myFocusNode;
  late SharedPreferences preferences;
  late bool loginData;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getData();
    myFocusNode = FocusNode();
  }

  void dispose() {
    username.dispose();
    password.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void _getData() async {
    preferences = await SharedPreferences.getInstance();
    loginData = (preferences.getBool('login') ?? true);
    print(loginData);
    if (loginData != true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blueGrey,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                          controller: username,
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.white),
                          keyboardType: TextInputType.name,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Username cannot empty";
                            }

                            return null;
                          },
                          //autofocus: true,
                          //focusNode: myFocusNode,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black54,
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
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
                      child: new TextFormField(
                          controller: password,
                          obscureText: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Password cannot empty";
                            }
                            return null;
                          },
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.white),
                          keyboardType: TextInputType.text,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black54,
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_Remember()));
                        },
                        child: Text(
                          'Remember',
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 16),
                        ),
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
                        onPressed: () {
                          String usernm = username.text;
                          if (_formKey.currentState!.validate()) {
                            preferences.setBool('login', true);
                            preferences.setString('username', usernm);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigation()));
                          }
                        },
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
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(105, 80, 2, 0),
                            child: Text(
                              'New at Trsto ?',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 80, 2, 0),
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
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
