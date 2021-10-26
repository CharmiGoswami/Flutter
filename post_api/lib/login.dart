import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'API/constant_api.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> onCreate() async {
    bool isValidation = _formKey.currentState?.validate() ?? false;

    if (isValidation) {
      final dynamic data = <String, dynamic>{
        'name': _usernameController.text.trim(),
        'password': _passwordController.text.trim(),
      };
      var url = Uri.parse('${Constant_API.baseAPI}${Constant_API.loginAPI}');
      var response = await http.post(url, body: data);
      print(response.statusCode);
      print(response.body);
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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                TextFormField(
                  controller: _usernameController,
                  validator: (String? s) {
                    if (s?.isEmpty ?? true) {
                      return 'Enter username';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter username',
                      labelText: 'Username',
                      suffixIcon: Icon(Icons.person)),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (String? s) {
                    if (s?.isEmpty ?? true) {
                      return 'Enter username';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.password)),
                  obscureText: true,
                  obscuringCharacter: '*',
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: onCreate, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
