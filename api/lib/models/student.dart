class Student {
  String? id;
  String? name;
  num? score;
  List<String>? hobbies;
  StudentPhysic? physics;
  //Result? results;

  Student({
    this.id,
    this.name,
    this.score,
    this.hobbies,
    this.physics,
    //this.results
  });

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        id: parsedJson['id'],
        name: parsedJson['name'],
        // results: Result.fromJson(
        //     parsedJson['result'].map((x) => x)),
        physics: StudentPhysic.fromJson(parsedJson['physic']),
        hobbies: List<String>.from(parsedJson['hobbies'].map((x) => x)),
        score: double.tryParse(
          parsedJson['score'],
        ));
  }
}

class StudentPhysic {
  StudentPhysic({this.height, this.weight});
  num? height;
  num? weight;

  factory StudentPhysic.fromJson(Map<String, dynamic> parseJson) {
    return StudentPhysic(
        height: parseJson['height'], weight: parseJson['weight']);
  }
}

// class Result {
//   Result({this.day, this.score});

//   String? day;
//   num? score;

//   factory Result.fromJson(Map<String, dynamic> parseJson) {
//     return Result(day: parseJson['day'], score: parseJson['score']);
//   }
// }


  //  "result":[
  //      { "day" : "Monday",
  //       "Score" : 20},
  //       { "day" : "Tuesday",
  //           "Score" : 40},
  //       { "day" : "Wedensday",
  //               "Score" : 10},
  //       { "day" : "Thusday",
  //               "Score" : 50},
  //       { "day" : "Friday",
  //               "Score" : 30},
  //       { "day" : "Saturday",
  //               "Score" : 30}
  //   ]

// student_score[
//   {
//     "id":"190110203107001",
//     "name":"Charmi Goswami",
//     "score":8.99
//   }
// ];