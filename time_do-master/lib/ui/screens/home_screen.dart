import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_do/controllers/task_controller.dart';
import 'package:time_do/models/task.dart';
import 'package:time_do/services/notification_services.dart';
import 'package:time_do/services/theme_services.dart';
import 'package:time_do/ui/screens/add_task_screen.dart';
import 'package:time_do/ui/screens/notification_screen.dart';
import 'package:time_do/ui/size_config.dart';
import 'package:time_do/ui/theme.dart';
import 'package:time_do/ui/widgets/buttonWidget.dart';
import 'package:time_do/ui/widgets/customAppBar_Widget.dart';
import 'package:time_do/ui/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_do/ui/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _taskController = Get.put(TaskController());
  NotifyHelper notifyHelper = NotifyHelper();
  DateTime _selectedate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskController.getTask();
    SizeConfig.orientation = Orientation.portrait;
    SizeConfig.screenHeight = 100;
    SizeConfig.screenWidth = 100;
    //notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIosPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // appBar: CustomAppBar(
      //   leadingWidget: IconButton(onPressed: (){
      //      notifyHelper.cancelAllNotification();
      //     _taskController.deleteAllTasks();
      //   }, icon: Icon(Icons.delete),),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [Text(
                      'Today: ',
                      style: Themes().homeScreenHeadingTextStyle,
                    ),
            Text(
                          '${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: Themes().homeScreenSubHeadingTextStyle,
                        ),
          ],
        ),
        actions:[IconButton(icon:Icon(Icons.add),
          color: Colors.black,onPressed: () => Get.to(() => AddTaskScreen(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 500)),)]
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           '${DateFormat.yMMMMd().format(DateTime.now())}',
            //           style: Themes().homeScreenSubHeadingTextStyle,
            //         ),
            //         // Text(
            //         //   'Today',
            //         //   style: Themes().homeScreenHeadingTextStyle,
            //         // ),
            //       ],
            //     )
            //   ],
            // ),
            _dateBar(),
            _tasks(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: primaryClr,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () => Get.to(() => AddTaskScreen(),
      //       transition: Transition.downToUp,
      //       duration: Duration(milliseconds: 500)),
      // ),
    );
  }

  Widget _dateBar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        onDateChange: (newDate) {
          setState(() {
            _selectedate = newDate;
          });
        },
        width: 70,
        height: 100,
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        dayTextStyle:
            TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),
        dateTextStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
            fontSize: 23,
            fontWeight: FontWeight.bold),
        monthTextStyle:
            TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),
      ),
    );
  }

  Widget _tasks() {
    return Expanded(child: Obx(() {
      if (_taskController.taskList.isEmpty) {
        return _noTasksMessage();
      } else {
        return AnimationLimiter(
          child: ListView.builder(
              itemCount: _taskController.taskList.length,
              itemBuilder: (BuildContext context, int index) {
                Task task = _taskController.taskList[index];
                final item= _taskController.taskList[index].toString();
                var date = DateFormat.jm().parse(task.startTime!);
                var myTime = DateFormat('HH:mm').format(date);
                handlingReminder(task.remind!, myTime, task);
                if (task.repeat == 'Daily' ||
                    task.date == DateFormat.yMd().format(_selectedate) ||
                    (task.repeat == 'Weekly' && _selectedate.difference(DateFormat.yMd().parse(task.date!)).inDays % 7 == 0)||
                    (task.repeat == 'Monthly' && DateFormat.yMd().parse(task.date!).day == _selectedate.day) ){
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: Duration(milliseconds: 500 + index * 20),
                    child: SlideAnimation(
                      horizontalOffset: 400.0,
                      child: FadeInAnimation(
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                           onDismissed: (direction) {
                          // Remove the item from the data source.
                          setState(() {
                             _taskController.deleteTask(task.id);
                              notifyHelper.cancelNotification(task.id!);
                              //Get.back();
                              
                             _taskController.taskList.removeAt(index);
                          });
                           },
                          background: Container(
                             height: MediaQuery.of(context).orientation == Orientation.portrait ?  MediaQuery.of(context).size.height *0.2:200,
                              width: MediaQuery.of(context).orientation == Orientation.portrait ?  MediaQuery.of(context).size.width :MediaQuery.of(context).size.width *0.7,
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: MediaQuery.of(context).orientation == Orientation.portrait ? 20 : 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Icon(Icons.delete, color: Colors.white,size: 35,),
                            ),alignment: Alignment.centerRight,
                            ),
                          child: TaskTile(task: task),
                        ),
                      ),
                    ),
                  );
                } else
                  return SizedBox(
                    height: 0,
                  );
              }),
        );
      }
    }));
  }

  displayBottomSheet(context, Task task) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return _bottomSheet(task);
        });
  }

  Widget _bottomSheet(Task task) {
    return Container(
      margin: EdgeInsets.all(20),
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.2
          : MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          task.isCompleted == 0
              ? Container(
                width: MediaQuery.of(context).size.width-40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                primary: Colors.purple
              ),
                    onPressed: () {
                      notifyHelper.cancelNotification(task.id!);
                      _taskController.markAsCompleted(task.id);
                      Get.back();
                    },
                    child: Text("Complete Task")),
              )
              : SizedBox(
                  height: 0,
                ),
          Container(
            width: MediaQuery.of(context).size.width-40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
                onPressed: () {
                  _taskController.deleteTask(task.id);
                  notifyHelper.cancelNotification(task.id!);
                  Get.back();
                },
                child: Text("Delete Task")),
          ),
        ],
      ),
    );
  }

  Widget _noTasksMessage() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const SizedBox(
                    height: 0,
                  )
                : const SizedBox(
                    height: 50,
                  ),
            SvgPicture.asset(
              'images/task.svg',
              height: 200,
              color: primaryClr.withOpacity(0.5),
              semanticsLabel: 'Tasks',
            ),
            const SizedBox(
              height: 20,
            ),
            Text("There Is No Tasks"),
          ],
        ),
      ),
    );
  }

  handlingReminder(int reminder, var myTime, Task task) {
    var minutes = int.parse(myTime.toString().split(':')[1]);
    var hours = int.parse(myTime.toString().split(':')[0]);
    if (reminder == 5) {
      notifyHelper.scheduledNotification(minutes < 5 ? hours - 1 : hours,
          minutes < 5 ? minutes + 55 : minutes - 5, task);
    } else if (reminder == 10) {
      notifyHelper.scheduledNotification(minutes < 10 ? hours - 1 : hours,
          minutes < 10 ? minutes + 50 : minutes - 10, task);
    } else if (reminder == 15) {
      notifyHelper.scheduledNotification(minutes < 15 ? hours - 1 : hours,
          minutes < 15 ? minutes + 45 : minutes - 15, task);
    } else
      notifyHelper.scheduledNotification(minutes < 20 ? hours - 1 : hours,
          minutes < 20 ? minutes + 40 : minutes - 20, task);
  }
}
