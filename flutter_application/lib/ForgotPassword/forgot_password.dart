import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/ForgotPassword/reset_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                      'Forgot\nPassword?',
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
                      'Dont worry! ',
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
                      "Just fill in your email and we'll send ",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "you a link to reset password ",
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
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Email cannot empty";
                          }
                          if (!text.contains('@')) {
                            return "@ is required";
                          }

                          return null;
                        },
                        //autofocus: true,
                        //focusNode: myFocusNode,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black54,
                          hintText: 'Email',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword()));
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
