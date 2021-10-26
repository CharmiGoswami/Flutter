class StudentFullListModal {
  StudentFullListModal({required this.studentsData});
  List<StudentData> studentsData;

  factory StudentFullListModal.fromJson(dynamic json) {
    return StudentFullListModal(
        studentsData:
            List<StudentData>.from(json.map((x) => StudentData.fromJson(x))));
  }
}

class StudentData {
  String? last_name;
  String? first_name;

  StudentData({this.last_name, this.first_name});

  factory StudentData.fromJson(Map<String, dynamic> student) {
    return StudentData(
        last_name: student['last_name'], first_name: student['first_name']);
  }
}
