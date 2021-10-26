class API_List {
  API_List(
      {this.id,
      this.first_name,
      this.last_name,
      this.user_id,
      this.username,
      this.rated,
      this.category_from_me,
      this.category_to_me,
      this.total_coin,
      this.profile_pic});

  String? id;
  String? first_name;
  String? last_name;
  String? user_id;
  String? username;
  bool? rated;
  num? category_from_me;
  num? category_to_me;
  num? total_coin;
  String? profile_pic;

  factory API_List.fromJson(Map<dynamic, dynamic> parsedJson) {
    return API_List(
      first_name: parsedJson['first_name'],
      last_name: parsedJson['last_name'],
      user_id: parsedJson['user_id'],
      username: parsedJson['username'],
      rated: parsedJson['rated'],
      category_from_me: parsedJson['category_from_me'],
      category_to_me: parsedJson['category_to_me'],
      total_coin: parsedJson['total_coin'],
      profile_pic: parsedJson['profile_pic'],
    );
  }
}
