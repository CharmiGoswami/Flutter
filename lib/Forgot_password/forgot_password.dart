import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Forgot_password/reset_password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                 child: Text('Forgot\nPassword?',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
               ),
             ],
           ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding:  EdgeInsets.fromLTRB(20, 8, 20,0),
                child:  Text("Dont worry!\nJust fill in your email and we'll send\nyou a link to reset password",style: TextStyle(color: Colors.grey,fontSize: 14),),
              ),
            ],
          ),
    
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0,0),
               
                child: Container(width: 200,height: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.withOpacity(0.2),),child: TextFormField(decoration: InputDecoration(hintText: 'Email',hintStyle: TextStyle(color: Colors.white,fontSize: 14)),),),
              ),
             
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20,0),
                child: SizedBox(height: 20,width: 200,child: ElevatedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ResetPassword()));
                }, child: Text('Submit'))),
              )
            ],
          )
        ],
      ),
    );
  }
}