import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/profile_model.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  _Change_PasswordState createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  var _formKey = GlobalKey<FormState>();
  String errorMsg = 'No data Found';
  ProfileDataModel? profileData;
  bool isVisible = false;
  onPswVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadProfileEditData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<String> _loadProfileAssets() async {
    return await rootBundle.loadString('assets/JSON/edit_profile.json');
  }

  void loadProfileEditData() async {
    String jsonString = await _loadProfileAssets();
    final jsonResponce = json.decode(jsonString);
    setState(() {
      profileData = ProfileDataModel.fromJson(jsonResponce);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                  'Change password',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ]),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: Text(
                      'Trsto requires that password used to\naccess any account be strong.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Color.fromRGBO(197, 233, 174, 80),
                    ),
                    Text(
                      ' At least 8 characters-the more characters, the better.',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Color.fromRGBO(197, 233, 174, 80),
                    ),
                    Text(
                      ' A mixture of both uppercase and lowercase letters',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Color.fromRGBO(197, 233, 174, 80),
                    ),
                    Text(
                      ' A mixture of letters and numbers',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Color.fromRGBO(197, 233, 174, 80),
                    ),
                    Text(
                      ' Inclusion of at least one special character. eg., !@#?]',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                child: Row(
                  children: [
                    Text(
                      'Old password',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.password}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Old password cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffixIcon: Image.asset(
                      'assets/images/Exclude.png',
                      width: 20,
                      height: 20,
                    ),
                    hintText: 'Abc@13!',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                child: Row(
                  children: [
                    Text(
                      'New password',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.password}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "New password cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: isVisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: onPswVisible,
                      color: Colors.grey[500],
                    ),
                    hintText: 'Abc@13!',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                child: Row(
                  children: [
                    Text(
                      'Retype new password',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.password}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "New password cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: isVisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: onPswVisible,
                      color: Colors.grey[500],
                    ),
                    hintText: 'Abc@13!',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Update profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
