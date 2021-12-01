class ProfileDataModel {
  String? last_name;
  String? first_name;
  String? birthdate_month;
  String? username;
  String? email;
  num? phone_no;
  List<String>? bio;
  String? instragram;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? profile;
  num? id;
  String? password;

  ProfileDataModel(
      {this.last_name,
      this.first_name,
      this.birthdate_month,
      this.username,
      this.email,
      this.phone_no,
      this.bio,
      this.instragram,
      this.facebook,
      this.twitter,
      this.linkedin,
      this.profile,
      this.id,
      this.password});

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
        last_name: json['last_name'],
        first_name: json['first_name'],
        birthdate_month: json['birthdate_month'],
        username: json['username'],
        email: json['email'],
        phone_no: json['phone_no'],
        bio: List<String>.from(json['bio'].map((x) => x)),
        instragram: json['instragram'],
        facebook: json['facebook'],
        twitter: json['twitter'],
        linkedin: json['linkedin'],
        profile: json['profile'],
        id: json['id'],
        password: json['password']);
  }
}

// {
//         "first_name": "Mireille",
//         "last_name": "Baumbach",
//         "birthdate_month": "2020-12-18T04:05:22.973Z",
//         "email": "Stefanie82@yahoo.com",
//         "phone_no": "301.661.9116 x233",
//         "bio": "Rap",
//         "instragram": "Madison78",
//         "facebook": "Berenice_Mayer",
//         "twitter": "Ayana.Schoen",
//         "linkedin": "Ofelia_Cormier33",
//         "profile": "http://placeimg.com/640/480",
//         "id": "1"
//     },
    