class TrstoUniverseModel {
  String? name;
  String? id;
  String? profile;
  String? username;
  String? icon;

  TrstoUniverseModel(
      {this.name, this.id, this.profile, this.username, this.icon});

  factory TrstoUniverseModel.fromJson(Map<String, dynamic> json) {
    return TrstoUniverseModel(
        name: json['name'],
        id: json['id'],
        profile: json['profile'],
        username: json['username'],
        icon: json['icon']);
  }
}
