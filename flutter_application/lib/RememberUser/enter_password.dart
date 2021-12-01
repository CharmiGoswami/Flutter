import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Home/home.dart';

class EnterPassword extends StatefulWidget {
  const EnterPassword({Key? key}) : super(key: key);

  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnterPassword()));
                        },
                        child: Text(
                          'Elena Gilbert',
                          style: TextStyle(color: Colors.amber, fontSize: 20),
                        )),
                    Text(
                      'elena_123',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                  child: new TextFormField(
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
                  padding: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                  child: MaterialButton(
                    height: 53,
                    minWidth: 340,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
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
          ],
        ),
      ),
    );
  }
}
