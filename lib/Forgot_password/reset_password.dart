import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({ Key? key }) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                 child: Text('Reset Password?',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
               ),
             ],
           ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding:  EdgeInsets.fromLTRB(20, 8, 20,0),
                child:  Text("Trsto requires that password used to\naccessany account be strong.",style: TextStyle(color: Colors.grey,fontSize: 12),),
              ),
            ],
          ),
    
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0,0),
               
                child: Container(width: 200,height: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.withOpacity(0.2),),child: TextFormField(obscureText: true,obscuringCharacter: '*',decoration: InputDecoration(hintText: 'New Password',hintStyle: TextStyle(color: Colors.white,fontSize: 14)),),),
              ),
             
            ],
          ),
           Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0,0),
               
                child: Container(width: 200,height: 20,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.withOpacity(0.2),),child: TextFormField(obscureText: true,obscuringCharacter: '*',decoration: InputDecoration(hintText: 'Confirm Password',hintStyle: TextStyle(color: Colors.white,fontSize: 14)),),),
              ),
             
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20,0),
                child: SizedBox(height: 20,width: 200,child: ElevatedButton(onPressed: (){}, child: Text('Submit'))),
              )
            ],
          )
        ],
      ),
    );
  }
}