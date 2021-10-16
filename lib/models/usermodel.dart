// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.success = 0,
        this.userid = 0,
        this.name = "",
        this.mobile = "",
        this.email = "",
        this.city = "",
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
