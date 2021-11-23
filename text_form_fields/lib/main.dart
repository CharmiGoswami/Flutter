import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text fields',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Text fields'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  bool isPswVisitable = false;
  final GlobalKey _formKey = GlobalKey<FormState>();

  int _counter = 0;

  void initState() {
    super.initState();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  onSubmit() {
    print(_emailController.text);
    print(_passwordController.text);

    if (_emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Email is required'),
      ));
    } else if (_passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password is required'),
      ));
    }
  }

  onPswVisiblity() {
    setState(() {
      isPswVisitable = isPswVisitable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                },
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _numberController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                    hintText: 'Number',
                    suffix: IconButton(
                        onPressed: onPswVisiblity, icon: Icon(Icons.phone))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                maxLength: 8,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: IconButton(
                        onPressed: onPswVisiblity,
                        icon: isPswVisitable
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: onSubmit, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
