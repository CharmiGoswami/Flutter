import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleauth/google_signin_auth';
import 'package:provider/provider.dart';

class WUserDeatails extends StatelessWidget {
  const WUserDeatails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Sign In Successfully',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          const SizedBox(height: 20),
          Text(
            'UserName : ${user.displayName!}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Text(
            'Email : ${user.email!}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Text(
            'UserId : ${user.uid}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              final signOut =
                  Provider.of<GoogleSignInAuth>(context, listen: false)
                      .googleLogOut();
            },
            child: const Text('Sign-Out'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue, // Background Color
            ),
          ),
        ],
      ),
    );
  }
}