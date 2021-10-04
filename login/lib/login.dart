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
          Flexible(
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2jYNITMyHacs50k8ZP0VBSL5DylJW1DAtbA&usqp=CAU',
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                  // child: Placeholder(
                  //   fallbackHeight: 700,
                  //   color: Colors.red,
                  // ),
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
