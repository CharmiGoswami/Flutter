class VibesModel {
  String? name;
  String? icon;
  String? catagory;
  String? profile;
  String? time;
  String? message;
  String? icon_clock;
  String? clock_time;
  String? icon_thumb_up;
  num? like_number;
  String? icon_thumb_down;
  num? dislike_number;
  String? thumb_like;
  String? like_text;
  String? thumb_dislike;
  String? dislike_text;
  String? text;
  String? image;
  String? icon_play;
  String? audio;

  VibesModel(
      {this.name,
      this.icon,
      this.catagory,
      this.profile,
      this.time,
      this.message,
      this.icon_clock,
      this.clock_time,
      this.icon_thumb_up,
      this.like_number,
      this.icon_thumb_down,
      this.dislike_number,
      this.thumb_like,
      this.like_text,
      this.thumb_dislike,
      this.dislike_text,
      this.text,
      this.image,
      this.icon_play,
      this.audio});

  factory VibesModel.fromJSON(Map<String, dynamic> json) {
    return VibesModel(
        name: json['name'],
        icon: json['icon'],
        catagory: json['catagory'],
        profile: json['profile'],
        time: json['time'],
        message: json['message'],
        icon_clock: json['icon_clock'],
        clock_time: json['clock_time'],
        icon_thumb_up: json['icon_thumb_up'],
        like_number: json['like_number'],
        icon_thumb_down: json['icon_thumb_down'],
        dislike_number: json['dislike_number'],
        thumb_like: json['thumb_like'],
        like_text: json['like_text'],
        thumb_dislike: json['thumb_dislike'],
        dislike_text: json['dislike_text'],
        text: json['text'],
        image: json['image'],
        icon_play: json['icon_play'],
        audio: json['audio']);
  }
}

// {
//         "name":"Zachary Hale",
//         "icon":"assets/images/Heart.png",
//         "catagory":"Arts",
//         "profile":"https://cdn.fakercloud.com/avatars/imammuht_128.jpg",
//         "time":"12 Aug 2021 04:19AM",
//         "message":"Once you have a few new business ideas in mind, you've completed the first step toward starting a company: you're inspired!",
//         "icon_clock":"assets/images/Clock.png",
//         "clock_time":"23:43:13",
//         "icon_thumb_up":"assets/images/Thumb.png",
//         "like_number":38,
//         "icon_thumb_down":"Icons.thumb_down_alt",
//         "dislike_number": 8 ,
//         "thumb_like":"assets/image/Thumb_like.png",
//         "like_text":"Yah!",
//         "thumb_dislike":"Icons.thumb_down_alt",
//         "dislike_text": "Boo!" ,
//         "text":"10 more Yah! to make it to the public",
//         "image":"",
//         "icon_play":"assets/images/Play.png",
//         "audio":"https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"
//     },