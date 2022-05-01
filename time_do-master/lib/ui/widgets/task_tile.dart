import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:time_do/models/task.dart';
import 'package:time_do/ui/theme.dart';

import '../../controllers/task_controller.dart';
import '../../services/notification_services.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
     NotifyHelper notifyHelper = NotifyHelper();
      final TaskController _taskController = Get.put(TaskController());
    bool valueIsCompleted = task.isCompleted == 1 ? true : false;
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ?  MediaQuery.of(context).size.height *0.2:200,
      width: MediaQuery.of(context).orientation == Orientation.portrait ?  MediaQuery.of(context).size.width :MediaQuery.of(context).size.width *0.7,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: MediaQuery.of(context).orientation == Orientation.portrait ? 20 : 0),
      decoration: BoxDecoration(
          color: task.color == 0 ? 
          // Color(Random().nextInt(0xffffffff)).withAlpha(0xff) 
          Colors.purple[50]
           : Colors.green,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${task.title}',
                        style:valueIsCompleted== false? Themes().taskTileHeadingTextStyle:Themes().taskTileHeadingTextStyleCompleted,
                      ),
                       Transform.scale(
                         scale: 1.5,
                        child: Checkbox(
                          splashRadius: 10,
                           checkColor: Colors.white,
                            activeColor: Colors.black,
                            shape: CircleBorder(),
                          value: valueIsCompleted, 
                          onChanged: valueIsCompleted == false ? 
                            (bool? value){    
                              notifyHelper.cancelNotification(task.id!);
                              _taskController.markAsCompleted(task.id);
                              Get.back();
                            } : null),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp,color:valueIsCompleted== false? Colors.black:Colors.white,),
                      const SizedBox(
                        width: 15,
                      ),
                      Text('${task.startTime} - ${task.endTime}',style: TextStyle(color:valueIsCompleted== false? Colors.black: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(child: SingleChildScrollView(child: Text('${task.note}',style: TextStyle(fontSize: 18,color:valueIsCompleted== false?Colors.black: Colors.white),)))
                ],
              ),
            ),
          ),
          // RotatedBox(
          //   quarterTurns: 3,
          //   child: task.isCompleted == 0 ? Text('',style: TextStyle(color: Colors.white)) : Text('COMPLETED',style: TextStyle(color: Colors.white)),
          // )
        ],
      ),
    );
  }


}
