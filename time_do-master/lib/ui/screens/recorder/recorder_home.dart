import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:time_do/ui/screens/recorder/sound_recorder.dart';
import 'package:time_do/ui/screens/recorder/timer_widget.dart';

import '../../theme.dart';
import '../note/add_note.dart';

class RecorderHome extends StatefulWidget {
  const RecorderHome({ Key? key }) : super(key: key);

  @override
  State<RecorderHome> createState() => _RecorderHomeState();
}

class _RecorderHomeState extends State<RecorderHome> {
final recorder=SoundRecorder();

final timerController=TimerController();

  bool isRecording=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recorder.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
recorder.dispose();

    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        title: Text('Recorder',style: Themes().homeScreenHeadingTextStyle),
        elevation: 0,
        backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
               height: 200,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 95,
                    backgroundColor: Colors.purple,
                    child: TimeWidget(controller: timerController,)
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                alignment: Alignment.center,
                child: FlatButton
                (
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black)
                  ),
                  color: Colors.purple[50],
                  
                  onPressed: () async{
                    setState(() {
                       isRecording=!isRecording;

                        if(isRecording){timerController.startTimer();}
                        else{timerController.stopTimer();}
                    });
                   final isRecord =await recorder.toggleRecording();

                   final isRecorder=recorder.isRecording;
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(isRecording==true? Icons.stop: Icons.mic,color: Colors.purple, size: 45,),
                  ),
                ),
              ),
            )
          ]
        ),
    );
  }
}