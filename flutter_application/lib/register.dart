import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool isVisible = false;

  var _formKey = GlobalKey<FormState>();

  onPswVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  onSubmit() {
    if (_emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Email is required'),
      ));
    }
    if (_passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password is required'),
      ));
    }
    if (!_passwordController.text.contains(RegExp(r"[A-Z]"))) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('At least one character is upper letter password'),
      ));
    }
    if (_confirmPasswordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Confirm password is required'),
      ));
    }
    if (_usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Username is required'),
      ));
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password and confirm password must be same'),
      ));
    }
    if (_passwordController.text.length <= 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Enter valid password'),
      ));
    }
    if (_usernameController.text.length <= 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Enter valid username'),
      ));
    }

    if (!_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Enter valid email'),
      ));
    }
  }

  late FocusNode myFocusNode;

  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueGrey,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 45, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.3)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: new Image.asset(
                        'assets/images/IconV3@3x.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 0, 0),
                      child: Text(
                        'Trsto',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(1, 15, 0, 0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        'Create account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Text(
                        'Register to get started',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 22,
                            fontStyle: FontStyle.normal),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Text(
                        'First name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(105, 30, 0, 0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                      child: SizedBox(
                        width: 155,
                        height: 50,
                        child: TextFormField(
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "First name can't empty";
                            }
                            return null;
                          },
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                              fontStyle: FontStyle.normal),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent.withOpacity(0.5),
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      new BorderSide(color: Colors.blueGrey)),
                              hintText: 'First name',
                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal)),
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
                              return "Last name can't empty";
                            }
                            return null;
                          },
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                              fontStyle: FontStyle.normal),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent.withOpacity(0.5),
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Last name',
                              hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                      child: Text('Username',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.normal)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: TextFormField(
                    controller: _usernameController,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent.withOpacity(0.5),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(color: Colors.blueGrey)),
                        hintText: 'Username',
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontStyle: FontStyle.normal)),
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
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent.withOpacity(0.5),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(color: Colors.blueGrey)),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Password ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          WidgetSpan(
                              child: Icon(Icons.info,
                                  size: 16, color: Colors.grey[400]))
                        ]),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: isVisible,
                    obscuringCharacter: '*',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                          icon: isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: onPswVisible,
                          color: Colors.grey[500],
                        ),
                        fillColor: Colors.transparent.withOpacity(0.5),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(color: Colors.blueGrey)),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Confirm password ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: isVisible,
                    obscuringCharacter: '*',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                          icon: isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: onPswVisible,
                          color: Colors.grey[500],
                        ),
                        fillColor: Colors.transparent.withOpacity(0.5),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(color: Colors.blueGrey)),
                        hintText: 'Confirm password',
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Reference code",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: TextFormField(
                    validator: (text) {
                      if (text!.length <= 5) {
                        return null;
                      }
                      return "Reference can't empty";
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent.withOpacity(0.5),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(color: Colors.blueGrey)),
                        hintText: 'Reference code ( Optional )',
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontStyle: FontStyle.normal)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: new Image.asset(
                              'assets/images/Exclude.png',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          TextSpan(
                            text: "Accept ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          TextSpan(
                            text: "Terms and conditions ",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          TextSpan(
                            text: "and above 18",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: MaterialButton(
                        height: 53,
                        minWidth: 330,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12)),
                        onPressed: () {
                          onSubmit();
                        },
                        child: Text(
                          "Let's get started",
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
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 20, 0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Have an account ?  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextSpan(
                              text: "Login ",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
