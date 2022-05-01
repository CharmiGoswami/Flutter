import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:time_do/models/task.dart';

import '../../../controllers/task_controller.dart';

class Account extends StatefulWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TaskController _taskController = Get.put(TaskController());
  Task? task ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _taskController.taskList.forEach((element) { 
     task=element;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: SfCartesianChart(
         primaryXAxis: CategoryAxis(),
        series: <LineSeries<Task, String>>[
                LineSeries<Task, String>(
                    dataSource: <Task>[task!],
                    xValueMapper: (Task task1, _) => task1.title,
                    yValueMapper: (Task task1, _) => task1.isCompleted,
                    name: 'Task',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
       );
    
  }
}