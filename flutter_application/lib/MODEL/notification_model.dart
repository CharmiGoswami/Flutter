import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Notification_Model {
  String? name;
  String? profile;
  String? verification;
  String? message;
  String? status;

  Notification_Model(
      {this.name, this.profile, this.verification, this.message, this.status});

  factory Notification_Model.fromJson(Map<String, dynamic> json) {
    return Notification_Model(
        name: json['name'],
        profile: json['profile'],
        verification: json['verification'],
        message: json['message'],
        status: json['status']);
  }
}



// {   
       
//         "name":"Silvia Willms",
//         "profile":"https://cdn.fakercloud.com/avatars/aleinadsays_128.jpg",
//         "verification":"assets/images/Exclude.png",
//         "message":"",
//         "status":"followed you"
//     },