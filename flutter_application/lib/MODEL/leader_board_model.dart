class LeaderBoardModel {
  String? name;
  num? coins;
  String? profile;
  String? id;

  LeaderBoardModel({
    this.name,
    this.coins,
    this.profile,
    this.id,
  });

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    return LeaderBoardModel(
      name: json['name'],
      coins: json['coins'],
      profile: json['profile'],
      id: json['id'],
    );
  }
}
// {
//         "coins":893,
//         "name": "Rudolph Nikolaus",
//         "profile": "https://cdn.fakercloud.com/avatars/silvanmuhlemann_128.jpg",
//         "id": "3"
//     }
    