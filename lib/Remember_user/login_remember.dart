// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/Remember_user/enter_password.dart';

// ignore: camel_case_types
class Login_Remember extends StatefulWidget {
  const Login_Remember({ Key? key }) : super(key: key);

  @override
  _Login_RememberState createState() => _Login_RememberState();
}

// ignore: camel_case_types
class _Login_RememberState extends State<Login_Remember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 5, 0),
                child:  Image.asset('assets/images/IconV3@3x.png',width: 50,height: 50,),
              ),
              const Text('Trsto',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
              const Padding(
                padding: EdgeInsets.fromLTRB(1, 8, 20, 0),
                child: Text('.',style: TextStyle(color:Colors.red,fontSize: 25,fontWeight: FontWeight.bold ),),
              )
            ],
          ),
         const SizedBox(
            height: 50,
          ),
           Row(
             // ignore: prefer_const_literals_to_create_immutables
             children: [
                const Padding(
                 padding:  EdgeInsets.fromLTRB(20, 0,20,0),
                 child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
               ),
             ],
           ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding:  EdgeInsets.fromLTRB(20, 8, 20,0),
                child:  Text('Welcome, world await your\namazing vibes',style: TextStyle(color: Colors.grey,fontSize: 18),),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
               Padding(
                        padding:const  EdgeInsets.fromLTRB(20, 8, 10,0),
                        child: CircleAvatar(
                          radius: 20,
                        
                          child: ClipOval(
                            
                            child:Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOOlvCzpMQub0HxfCNcjIYmDwm2Nc6glVoBg&usqp=CAU',width: 60,height: 60,fit: BoxFit.fill,)
                          ),
                        ),
                      ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>EnterPassword()));
                  },child: Text('Elena Gilbert',style: TextStyle(color: Colors.amber,fontSize: 20),)),
                  
                  Text('elena_123',style: TextStyle(color: Colors.white,fontSize: 14),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20,0),
                child: Container(color:Colors.white.withOpacity(0.3),child: Icon(Icons.cancel_presentation_outlined,color: Colors.white,size: 15,)),
              )
            ],
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0,0),
               
                child: Container(color: Colors.white.withOpacity(0.3),child: Icon(Icons.add,color: Colors.white,size: 15,)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Login into another account',style: TextStyle(color: Colors.white,fontSize: 16),),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20,0),
                child: SizedBox(height: 20,width: 200,child: ElevatedButton(onPressed: (){}, child: Text('Create a account'))),
              )
            ],
          )
        ],
      ),
    );
  }
}