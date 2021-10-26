import 'dart:convert';

import 'package:api/models/common_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/api_constant.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _pswCtrl = TextEditingController();
  final TextEditingController _idCtrl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  void dispose() {
    _nameCtrl.dispose();
    _pswCtrl.dispose();
    _idCtrl.dispose();
    super.dispose();
  }

  Future<void> onCreate() async {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      final dynamic data = <String, dynamic>{
        'username': _nameCtrl.text.trim(),
        'password': _pswCtrl.text.trim(),
        'id': _idCtrl.text.trim()
      };

      var url = Uri.parse('${APIConstant.basedUrl}${APIConstant.newUrl}');
      var response = await http.post(url, body: data);
      print(response.statusCode);

      setState(() {
        isLoading = true;
      });

      // if (response.statusCode == 200) {
      //   Map<String, dynamic> decodeJson = json.decode(response.body);
      //   Common_Response_Modal common_response_modal =
      //       Common_Response_Modal.fromJson(decodeJson);

      //   if (common_response_modal.status == 'success') {
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text('Success'),
      //     ));
      //   } else { ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text('Fail'),
      //     ));}
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _idCtrl,
                    validator: (String? s) {
                      if (s?.isEmpty ?? true) {
                        return 'Enter Id';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Id',
                      hintText: 'Enter your Id',
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                  ),
                  TextFormField(
                    controller: _nameCtrl,
                    validator: (String? s) {
                      if (s?.isEmpty ?? true) {
                        return 'Enter Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your name',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  TextFormField(
                    validator: (String? s) {
                      if (s?.isEmpty ?? true) {
                        return 'Enter Password';
                      }
                    },
                    obscureText: true,
                    obscuringCharacter: '*',
                    controller: _pswCtrl,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: onCreate,
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : Text('Create'))
                ],
              ),
            ),
          ),
        ));
  }
}
