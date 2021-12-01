class NewRequestModel {
  String? name;
  String? profile;
  String? username;
  bool? selected;

  NewRequestModel({this.name, this.profile, this.username, this.selected});

  factory NewRequestModel.fromJson(Map<String, dynamic> json) {
    return NewRequestModel(
        name: json['name'],
        profile: json['profile'],
        username: json['username'],
        selected: json['selected']);
  }

  set isSelected(bool isSelected) {}
}

// {
        
//         "name": "Stephen Shields",
//         "profile": "https://cdn.fakercloud.com/avatars/mhudobivnik_128.jpg",
//         "username":"@stephen@.org"
      
//     }