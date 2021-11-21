import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tifac/models/usermodel.dart';
import 'package:tifac/screens/homescreen.dart';
import 'package:tifac/screens/registration.dart';
import 'package:tifac/screens/signup.dart';
import 'package:tifac/services/shared_preferences.dart';

class OtpVerifyAndLogin extends StatefulWidget {
  final Map otpBody;
  final String username;

  const OtpVerifyAndLogin(
      {Key? key, required this.otpBody, required this.username})
      : super(key: key);

  @override
  _OtpVerifyAndLoginState createState() => _OtpVerifyAndLoginState();
}

class _OtpVerifyAndLoginState extends State<OtpVerifyAndLogin> {
  late Map otpBody;
  String pin = "";
  double width = 0, height = 0;
  String city = "", name = "", email ="";  
  bool response_otp = false, apiCall = false;
  int userId = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    city = UserSharedPreferences.getCity() ?? '';
    name = UserSharedPreferences.getName() ?? '';
    email = UserSharedPreferences.getEmail() ?? '';
    userId = UserSharedPreferences.getUserId() ?? -1;
    if (city != '' &&
        name != '' &&
        widget.username != '' &&
        email != '' &&
        userId != -1) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    otpBody = widget.otpBody;
    return apiCall
        ? Center(child: const CircularProgressIndicator())
        : Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 40,
                    right: 20,
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/tifac_logo.png',
                        height: height / 4,
                        width: width / 2,
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Verify & SignIn",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.04,
                      ),
                    ),
                  ),
                ),
                // Input Field.
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 12,
                  ),
                  child: Container(
                    width: width * 0.66,
                    alignment: Alignment.center,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your OTP',
                      ),
                      onChanged: (text) {
                        pin = text;
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: height / 10,
                ),
                // Register Button
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed: () async {
                      response_otp = await verifyOTPSend(pin);
                      if (response_otp) {
                        setState(() {
                          apiCall = true;
                        });
                        // ignore: todo
                        // TODO: Get OTP. Check the api call and sign in the user use shared preference.
                        //_onPressedSendOTP();
                        if (widget.username.length == 12) {
                          widget.username.substring(4);
                          print('Username after trimming ${widget.username}');
                        }
                        Future.delayed(
                          const Duration(
                            microseconds: 500,
                          ),
                        ).then((value) async {
                          UserModel response =
                              await signInUser("91" + widget.username);
                          setState(() {
                            apiCall = false;
                          });
                          if (response.success == 1) {
                            // Add shared preference
                            await UserSharedPreferences.setEmail(
                                response.email);
                            await UserSharedPreferences.setName(response.name);
                            await UserSharedPreferences.setUserId(
                                response.userid);
                            await UserSharedPreferences.setCity(response.city);
                            await UserSharedPreferences.setUsername(
                                widget.username);
                            // ignore: avoid_print
                            print(
                                "Stored Name is: ${UserSharedPreferences.getName()}");
                            // ignore: avoid_print
                            print(
                                "name ${response.name}, email: ${response.email}, userID:${response.userid}, email:${response.email}");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const HomeScreen(),
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const RegistrationPage(),
                              ),
                            );
                          }
                        });
                      }
                    },
                    color: Colors.blue,
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    minWidth: width / 2,
                  ),
                )
              ],
            ),
          );
  }

  Future<UserModel> signInUser(String number) async {
    String apiUrl = "https://tifac.wipurl.com/index.php/signin";
    // ignore: avoid_print
    print(number);
    Map encodeNumber = {
      "username": number,
    };
    // ignore: avoid_print
    print(jsonEncode(encodeNumber));
    final response = await http.post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(encodeNumber));

    if (response.statusCode == 200) {
      // The response is okay and can be processed.
      // ignore: avoid_print
      print(response.toString());
      final responseString = response.body;
      // ignore: avoid_print
      print(responseString);
      var userModelFromResponse = jsonDecode(responseString);
      // ignore: avoid_print
      print('${userModelFromResponse} and ${userModelFromResponse["success"]}');
      if (userModelFromResponse["success"] == 1) {
        // UserModel Sign in Successful.
        userModelFromResponse = userModelFromJson(responseString);
        return userModelFromResponse;
      } else {
        // UsermodelApi hit but sign in failed.
        return UserModel();
      }
    }
    return UserModel();
    //Use the post and get the response check the response and return the usermodel.
  }

  Future<http.Response> verifyOTP(String pin, String sessionid) {
    return http.get(Uri.parse(
        "https://2factor.in/API/V1/7f74ac95-4451-11ec-a13b-0200cd936042/SMS/VERIFY/${sessionid}/${pin}"));
  }

  Future<bool> verifyOTPSend(String pin) async {
    http.Response finalOTP = await verifyOTP(pin, otpBody["Details"]);
    var finalOTPBody = jsonDecode(finalOTP.body);
    // ignore: avoid_print
    print(finalOTPBody);
    if (finalOTPBody["Status"] == "Success") {
      return true;
    }
    return false;
  }
}
