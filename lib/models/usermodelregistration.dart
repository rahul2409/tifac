
import 'dart:convert';

UserModelRegister userModelRegisterFromJson(String str) => UserModelRegister.fromJson(json.decode(str));

String userModelRegisterToJson(UserModelRegister data) => json.encode(data.toJson());

class UserModelRegister {
    UserModelRegister({
        this.success = 0,
        this.userid = 0,
    });

    int success;
    int userid;

    factory UserModelRegister.fromJson(Map<String, dynamic> json) => UserModelRegister(
        success: json["success"],
        userid: json["userid"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "userid": userid,
    };
}
