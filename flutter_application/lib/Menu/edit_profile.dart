import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/MODEL/profile_model.dart';

import '../API/api.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  var _formKey = GlobalKey<FormState>();
  var items = ['+1', '+91'];
  String dropdownvalue = '+1';
  bool isLoading = true;

  String errorMsg = 'No data Found';
  ProfileDataModel? profileData;

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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Row(
                children: [
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
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: new Image.network(
                          '${profileData?.profile}',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'We recommend an image of\nat least 800×800px.',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'First name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(105, 20, 0, 0),
                    child: Text(
                      'Last name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                    ),
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: SizedBox(
                    width: 155,
                    height: 50,
                    child: TextFormField(
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "First name cannot empty";
                        }

                        return null;
                      },
                      controller: TextEditingController.fromValue(
                        TextEditingValue(
                          text: '${profileData?.first_name}',
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'First name',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 20, 0),
                  child: SizedBox(
                    width: 155,
                    height: 50,
                    child: TextFormField(
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "Last name cannot empty";
                        }

                        return null;
                      },
                      controller: TextEditingController.fromValue(
                        TextEditingValue(
                          text: '${profileData?.last_name}',
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Last name',
                      ),
                    ),
                  ),
                ),
              ]),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Date of birth',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 25, 0, 0),
                    child: new Image.asset(
                      'assets/images/Filled.png',
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.birthdate_month}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Birthdate cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_today_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                    hintText: 'Birthdate',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Email',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.email}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Email cannot empty";
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
                    hintText: 'email@gmail.com',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Country',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Text(
                      'Phone No',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.normal),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent.withOpacity(0.5)),
                      child: DropdownButton(
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(items,
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ));
                        }).toList(),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 20, 0),
                      child: TextFormField(
                        controller: TextEditingController.fromValue(
                          TextEditingValue(
                            text: '${profileData?.phone_no}',
                          ),
                        ),
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "PhoneNo cannot empty";
                          }

                          return null;
                        },
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                            fontStyle: FontStyle.normal),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Phone No',
                          suffixIcon: new Image.asset(
                            'assets/images/Filled.png',
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Bio',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.bio}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Bio cannot empty";
                    }

                    return null;
                  },
                  maxLines: 10,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Bio',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Social media connect',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Instragram',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.instragram}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Instragram ID cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'ID ',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Facebook',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.facebook}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Facebook ID cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'ID ',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Twitter',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.twitter}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Twitter ID cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'ID ',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Linkedin',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: TextFormField(
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: '${profileData?.linkedin}',
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Linkedin ID cannot empty";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontStyle: FontStyle.normal),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'ID ',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
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
              SafeArea(
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.download_rounded,
                            color: Colors.white,
                          ),
                          label: Text('Download Data',
                              style: TextStyle(color: Colors.white)),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              side:
                                  BorderSide(color: Colors.black, width: 0.9)),
                        )),
                    SizedBox(
                      width: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 20, 0),
                        child: OutlinedButton.icon(
                          onPressed: () {
                            showCupertinoDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    title: Text(
                                      'Delete account',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                        'Are you sure you want to delete your accout? Hope you know that you will loose all the coins and score you earned from trsto universe.',
                                        style: TextStyle(fontSize: 18)),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text('No, I want to keep'),
                                        isDestructiveAction: true,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: Text('Yes, I want to delete'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.delete_outline, color: Colors.white),
                          label: Text('Delete',
                              style: TextStyle(color: Colors.white)),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              side:
                                  BorderSide(color: Colors.black, width: 0.9)),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
