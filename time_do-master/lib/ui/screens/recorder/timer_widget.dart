import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class TimerController extends ValueNotifier<bool>{
  TimerController({bool isPlaying=false}):super(isPlaying);

  void startTimer()=> value=true;
  void stopTimer()=> value=false;

}

class TimeWidget extends StatefulWidget {

  final TimerController controller;
  const TimeWidget({ Key? key , required this.controller}) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  Duration duration=Duration();

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.controller.addListener(() {
      if(widget.controller.value){
        startTimer();
      }else{
        stopTimer();
      }
    });
  }

  void reset()=>setState(() => duration=Duration());

  void addTime(){
    final addSeconds=1;

    setState(() {
      final seconds=duration.inSeconds+addSeconds;

      if(seconds<0){
        timer?.cancel();
      }else{
        duration=Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets=true}){
    if(!mounted)return;
    if(resets){
      reset();
    }

    timer=Timer.periodic(Duration(seconds: 1),(_)=>addTime());
  }

  void stopTimer({bool resets=true}){
    if(!mounted) return;
    if(resets){
      reset();
    }

    setState(() => timer?.cancel());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${duration.inMinutes}:${duration.inSeconds}',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
    );
  }
}