class CircleListModel {
  String? name;
  String? id;
  String? profile;
  String? username;
  String? icon;

  CircleListModel({this.name, this.id, this.profile, this.username, this.icon});

  factory CircleListModel.fromJson(Map<String, dynamic> json) {
    return CircleListModel(
        name: json['name'],
        id: json['id'],
        profile: json['profile'],
        username: json['username'],
        icon: json['icon']);
  }
}

// {
//         "username":"@ella@.org",
//         "name": "Ella Harris",
//         "profile": "https://cdn.fakercloud.com/avatars/souuf_128.jpg",
//         "icon":"assets/images/Heart.png",
//         "id": "1"
        
//     }