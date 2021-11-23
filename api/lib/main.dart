import 'dart:convert';

import 'package:api/login/login.dart';
import 'package:api/student_full.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student? student;
  //StudentPhysic? studentPhysic;
  //Result? result;
  //Student(id: '1025', name: 'Charmi', score: 8.90);

  void initState() {
    loadStudent();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Future<String> _loadStudentAssets() async {
    return await rootBundle.loadString('assets/student.json');
  }

  Future loadStudent() async {
    //get data from assets
    String jsonString = await _loadStudentAssets();
    final jsonResponce = json.decode(jsonString);
    setState(() {
      student = Student.fromJson(jsonResponce);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Id: ${student?.id}',
            ),
            Text(
              'Name: ${student?.name}',
            ),
            Text(
              'Score: ${student?.score}',
            ),

            Text(
              'Height: ${student?.physics?.height}',
            ),
            Text(
              'Weight: ${student?.physics?.weight}',
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: student?.hobbies?.length ?? 0,
                    itemBuilder: (_, int i) {
                      return Text('${student?.hobbies?[i]}');
                    })),
            Text(
              'Weekly result',
            ),
            //   Expanded(
            //       child: ListView.builder(
            //         shrinkWrap: true,
            //           itemCount: student?.results?.length ?? 0,
            //           itemBuilder: (_, int i) {
            //             return Text('${student?.results?[i].day} : ${student?.results?[i].score}');
            //           })),
            SafeArea(
              child: FloatingActionButton.extended(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Get API data'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
