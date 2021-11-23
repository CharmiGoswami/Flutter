// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterPassword extends StatefulWidget {
  const EnterPassword({ Key? key }) : super(key: key);

  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
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
                  Text('Elena Gilbert',style: TextStyle(color: Colors.amber,fontSize: 20),),
                  
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
               
                child: Container(width: 200,height: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.withOpacity(0.2),),child: TextFormField(decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(color: Colors.white,fontSize: 14)),),),
              ),
             
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20,0),
                child: SizedBox(height: 20,width: 200,child: ElevatedButton(onPressed: (){}, child: Text('Login'))),
              )
            ],
          )
        ],
      ),
    );
  }
}