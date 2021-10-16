// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.success,
        required this.userid,
        required this.name,
        required this.mobile,
        required this.email,
        required this.city,
    });

    int success;
    int userid;
    String name;
    String mobile;
    String email;
    String city;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        userid: json["userid"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "userid": userid,
        "name": name,
        "mobile": mobile,
        "email": email,
        "city": city,
    };
}
