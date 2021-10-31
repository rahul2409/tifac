/*
{
    "name":"rahul",
    "email":"abc@123.com",
    "city":"Mumbai",
    "designation":"doctor",
    "qualification":"MTECH",
    "productspecification":"none.",
    "fieldofinnovation":"noneee.",
    "username": "919619925240"
}
*/

// To parse this JSON data, do
//
//     final addInnovator = addInnovatorFromJson(jsonString);

import 'dart:convert';

AddInnovator addInnovatorFromJson(String str) => AddInnovator.fromJson(json.decode(str));

String addInnovatorToJson(AddInnovator data) => json.encode(data.toJson());

class AddInnovator {
    AddInnovator({
        this.success = 0,
        this.userid = 0,
    });

    int success;
    int userid;

    factory AddInnovator.fromJson(Map<String, dynamic> json) => AddInnovator(
        success: json["success"],
        userid: json["userid"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "userid": userid,
    };
}
