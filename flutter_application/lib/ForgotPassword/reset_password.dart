import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController newPsw = TextEditingController();
  TextEditingController confirmPsw = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
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
                      'Reset Password?',
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
                      'Trsto requires that password used to ',
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
                      "accessany account be strong. ",
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
                    child: new TextFormField(
                        controller: newPsw,
                        obscureText: true,
                        validator: (text) {
                          if (text!.isEmpty ||
                              text.length < 8 && text.contains('[A-Z]')) {
                            return "Password must be 8 character long and it contain at least one upper case letter";
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
                          hintText: 'New Password',
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
                        controller: confirmPsw,
                        obscureText: true,
                        validator: (text) {
                          if (text!.isEmpty ||
                              text.length < 8 && text.contains('[A-Z]')) {
                            return "Confirm password must be 8 character long and it contain at least one upper case letter";
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
                          hintText: 'Confirm Password',
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
                    padding: const EdgeInsets.fromLTRB(20, 13, 20, 0),
                    child: MaterialButton(
                      height: 53,
                      minWidth: 340,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (newPsw.text == confirmPsw.text) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'New password and Confirm password must be same'),
                            ));
                          }
                        }
                      },
                      child: Text(
                        "Submit",
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
      ),
    );
  }
}
