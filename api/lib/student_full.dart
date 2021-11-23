import 'dart:convert';

import 'package:api/models/student_list_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/api_constant.dart';

class Student_full_list extends StatefulWidget {
  const Student_full_list({Key? key}) : super(key: key);

  @override
  _Student_full_listState createState() => _Student_full_listState();
}

class _Student_full_listState extends State<Student_full_list> {
  List<StudentData> arrStudent = [];
  bool isLoading = true;
  String errorMsg = 'No data Found';
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      getStudentData();
    });
    super.initState();
  }

  getStudentData() async {
    var url = Uri.parse('${APIConstant.basedUrl}${APIConstant.studentList}');

    var response = await http.get(url);

    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonRes = json.decode(response.body);
      StudentFullListModal studentFullListModal =
          StudentFullListModal.fromJson(jsonRes);
      setState(() {
        arrStudent = (studentFullListModal.studentsData);
        isLoading = false;
      });
    } else if (response.statusCode == 404) {
      setState(() {
        isLoading = false;
        errorMsg = 'API not found';
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: arrStudent.length,
              itemBuilder: (_, int i) {
                return ListTile(
                  title: Text(arrStudent[i].last_name ?? ''),
                  leading: Text(arrStudent[i].first_name ?? ''),
                );
              }),
    );
  }
}
