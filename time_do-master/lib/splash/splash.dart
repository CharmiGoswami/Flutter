import 'dart:async';

import 'package:flutter/material.dart';

import '../bottom/bottomapp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 7),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => BottomNavigation()  
            )  
         )  
    );  
  }  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset('images/splash.gif',height: 250,width: 250,fit: BoxFit.fill,),
      ),
    );
  }
}