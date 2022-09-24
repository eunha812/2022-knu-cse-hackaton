// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.password,
    this.location,
    this.name,
    this.age,
    this.gender,
    this.time,
    this.report,
    this.imgUrl,
  });

  String? id;
  String? password;
  String? location;
  String? time;
  String? name;
  String? age;
  String? gender;
  String? report;
  String? imgUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        location: json["location"],
        time: json["time"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        report: json["report"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "location": location,
        "time": time,
        "name": name,
        "age": age,
        "gender": gender,
        "report": report,
        "imgUrl": imgUrl,
      };

  // print properties for debug
  void printProperties() {
    debugPrint("id: $id\n");
    debugPrint("password: $password\n");
    debugPrint("location: $location\n");
    debugPrint("name: $name\n");
    debugPrint("time: $time\n");
    debugPrint("age: $age\n");
    debugPrint("gender: $gender\n");
    debugPrint("report: $report\n");
  }
}
