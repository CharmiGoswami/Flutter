import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleauth/userdetail.dart';
import 'package:provider/provider.dart';
import 'package:googleauth/google_signin_auth';

class WGoogleSignIn extends StatefulWidget {
  const WGoogleSignIn({Key? key}) : super(key: key);

  @override
  State<WGoogleSignIn> createState() => _WGoogleSignInState();
}

class _WGoogleSignInState extends State<WGoogleSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign-In'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wromg'),
            );
          } else if (snapshot.hasData) {
            return const WUserDeatails();
          } else {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      final signIn =
                          Provider.of<GoogleSignInAuth>(context, listen: false)
                              .googleLogin();
                    },
                    child: const Text('Sign-In'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue, // Background Color
                    ),
                  ),
                ],
              ),
            );
            ;
          }
        },
      ),
    );
  }
}
