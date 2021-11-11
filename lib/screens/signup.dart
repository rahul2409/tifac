import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tifac/models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:tifac/screens/homescreen.dart';
import 'package:tifac/screens/registration.dart';
import 'package:tifac/services/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  String pin = "";
  String email = "";
  String number = "";
  String city = "";
  double height = 0;
  bool apiCall = false;
  bool isVerified = false;
  int userId = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    city = UserSharedPreferences.getCity() ?? '';
    name = UserSharedPreferences.getName() ?? '';
    number = UserSharedPreferences.getUsername() ?? '';
    email = UserSharedPreferences.getEmail() ?? '';
    userId = UserSharedPreferences.getUserId() ?? -1;
    if (city != '' &&
        name != '' &&
        number != '' &&
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
    height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (apiCall) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Image Of the Login Screen
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
              // Register Note.
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In for TIFAC",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.04,
                    ),
                  ),
                ),
              ),
              // Input field for mobile number
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          labelText: 'Enter your mobile Number',
                        ),
                        onChanged: (text) {
                          number = text;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: _onPressedSendOTP,
                      child: const Text(
                        'Get OTP',
                        style: TextStyle(color: Color.fromRGBO(5, 0, 154, 1)),
                      ),
                    ),
                    width: 60,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          labelText: 'Enter the OTP',
                        ),
                        onChanged: (text) {
                          pin = text;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    child: MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        var verify = await verifyOTPSend(pin);
                        setState(() {
                          isVerified = verify;
                        });
                      },
                      child: const Text(
                        'Verify',
                        style: TextStyle(color: Color.fromRGBO(5, 0, 154, 1)),
                      ),
                    ),
                    width: 60,
                  ),
                ],
              ),

              SizedBox(
                height: height / 10,
              ),
              // Register Button
              Container(
                alignment: Alignment.center,
                child: MaterialButton(
                  onPressed: isVerified
                      ? () async {
                          setState(() {
                            apiCall = true;
                          });
                          // ignore: todo
                          // TODO: Get OTP. Check the api call and sign in the user use shared preference.
                          //_onPressedSendOTP();
                          UserModel response = await signInUser("91" + number);
                          setState(() {
                            userId = response.userid;
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
                                "91" + number);
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
                                builder: (builder) => const SignUpPage(),
                              ),
                            );
                          }
                        }
                      : null,
                  color: Colors.blue,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Sign In ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  minWidth: width / 2,
                ),
              ),
              // Already Have an account? sign in using OTP.
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New User?'),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => const RegistrationPage(),
                          ),
                        );
                      },
                      child: const Text('Register Here.'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
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
      final userModelFromResponse = userModelFromJson(responseString);
      // ignore: avoid_print
      print(userModelFromResponse);
      if (userModelFromResponse.success == 1) {
        // UserModel Sign in Successful.
        return userModelFromResponse;
      } else {
        // UsermodelApi hit but sign in failed.
        return UserModel();
      }
    }
    return UserModel();
    //Use the post and get the response check the response and return the usermodel.
  }

  Future<http.Response> fetchOTP(String number) {
    return http.get(
      Uri.parse(
          "https://2factor.in/API/V1/3ce240d6-2390-11ec-a13b-0200cd936042/SMS/${number}/AUTOGEN"),
    );
  }

  Future<http.Response> verifyOTP(String pin, String sessionid) {
    return http.get(Uri.parse(
        "https://2factor.in/API/V1/3ce240d6-2390-11ec-a13b-0200cd936042/SMS/VERIFY/${sessionid}/${pin}"));
  }

  // ignore: unused_element
  void _onPressedSendOTP() async {
    // API call to fetch the otp and save it in pin.
    http.Response otp = await fetchOTP(number);
    // ignore: avoid_print
    print(otp.body);
    otpBody = jsonDecode(otp.body);
    // Function call to get the the OTP
  }

  // ignore: prefer_typing_uninitialized_variables
  var otpBody;
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
