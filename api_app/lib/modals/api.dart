class API {
  API(
      {this.first_name,
      this.last_name,
      this.region,
      this.country,
      this.bio,
      this.post,
      this.followers,
      this.following,
      this.profile_pic});

  String? first_name;
  String? last_name;
  String? region;
  String? country;
  String? bio;
  num? post;
  num? followers;
  num? following;
  String? profile_pic;

  factory API.fromJson(Map<String, dynamic> parsedJson) {
    return API(
      first_name: parsedJson['first_name"'],
      last_name: parsedJson['last_name'],
      region: parsedJson['region'],
      country: parsedJson['country'],
      bio: parsedJson['bio'],
      post: parsedJson['post'],
      followers: parsedJson['followers'],
      following: parsedJson['following'],
      profile_pic: parsedJson['profile_pic'],
    );
  }
}
