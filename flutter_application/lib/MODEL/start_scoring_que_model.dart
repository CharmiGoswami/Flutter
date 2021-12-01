class StartScoringQueModel {
  String? que;
  String? btn1;
  String? btn2;
  String? btn3;
  String? btn4;
  String? btn5;

  StartScoringQueModel(
      {this.que, this.btn1, this.btn2, this.btn3, this.btn4, this.btn5});

  factory StartScoringQueModel.fromJson(Map<String, dynamic> json) {
    return StartScoringQueModel(
      que: json['que'],
      btn1: json['btn1'],
      btn2: json['btn2'],
      btn3: json['btn3'],
      btn4: json['btn4'],
      btn5: json['btn5'],
    );
  }
}

    // {
    // "que":"What the age of this person ?",
    // "btn1":"Below 18",
    // "btn2":"18-25",
    // "btn3":"25-35",
    // "btn4":"35+",
    // "btn5":"Not sure"
    // },