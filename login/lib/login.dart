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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            // child: Image.network(
            //   'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.kindpng.com%2Fimgv%2FobRJJT_user-profile-avatar-login-account-male-user-icon%2F&psig=AOvVaw3henmzg8sRY2gDZ6JTZDMF&ust=1633150230138000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIjmuOy0qPMCFQAAAAAdAAAAABAD',
            //   height: 400,
            //   width: 100,
            // )
            child: Placeholder(
              color: Colors.red,
            ),
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: "Username"),
            ),
          )
        ],
      ),
    );
  }
}
