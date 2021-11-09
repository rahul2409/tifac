import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tifac/models/UserModelRegistration.dart';
import 'package:tifac/models/usermodel.dart';
import 'package:tifac/screens/homescreen.dart';
import 'package:tifac/screens/signup.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String name = "";
  late SharedPreferences sharedPreferences;
  String city = "";
  String email = "";
  double height = 0;
  double width = 0;
  String number = "";
  int preferencebool = 0;
  bool loading = false;
  late UserModelRegister _userModelRegister;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                        "Register For TIFAC",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.04,
                        ),
                      ),
                    ),
                  ),
                  // Input field for name
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 12,
                    ),
                    child: Container(
                      width: width - 30,
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter the name for registration',
                        ),
                        onChanged: (text) {
                          name = text;
                        },
                      ),
                    ),
                  ),
                  // Input field for mobile number
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 12,
                    ),
                    child: Container(
                      width: width - 30,
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your mobile Number',
                        ),
                        onChanged: (text) {
                          number = "91" + text;
                        },
                      ),
                    ),
                  ),
                  // Input field for email-id
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 12,
                    ),
                    child: Container(
                      width: width - 30,
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your email address',
                        ),
                        onChanged: (text) {
                          email = text;
                        },
                      ),
                    ),
                  ),
                  // Input field for email-id
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 12,
                    ),
                    child: Container(
                      width: width - 30,
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your City',
                        ),
                        onChanged: (text) {
                          city = text;
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
                        setState(() {
                          loading = true;
                        });
                        sharedPreferences =
                            await SharedPreferences.getInstance();
                        UserModelRegister response =
                            await onPressedRegister(name, email, city, number);
                        print(
                            "Response arrived successful with success = ${response.success} and userID ${response.userid} ${response.toString()}");
                        // Need to set shared preference.
                        setState(() {
                          loading = false;
                        });
                        if (response.success == 1) {
                          sharedPreferences.setInt("userId", response.userid);
                          sharedPreferences.setString("name", name);
                          sharedPreferences.setString("email", email);
                          sharedPreferences.setString("mobilenumber", number);
                          sharedPreferences.setString("city", city);
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
                      },
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Register",
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
                        const Text('Already Registered?'),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: const Text('Sign In Here'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future<UserModelRegister> onPressedRegister(
      String name, String email, String city, String number) async {
    final String apiUrl = "https://tifac.wipurl.com/index.php/signup";
    if (name != null && email != null && city != null && number != null) {
      Map bodyRegistration = {
        "name": "${name}",
        "email": "${email}",
        "city": "${city}",
        "username": "${number}",
      };
      final response = await http.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(bodyRegistration));
      print(
          "name : ${name}, email: ${email}, city: ${city}, username: ${number} ");
      if (response.statusCode == 200) {
        print("Status 200 reached. response is being processed..");
        final responseString = response.body;
        final userModelFromResponse = userModelRegisterFromJson(responseString);
        if (userModelFromResponse.success == 1) {
          print(
              "response success = 1 and user id = ${userModelFromResponse.userid}");
          return userModelFromResponse;
        } else {
          print("Response success = 0");
          return UserModelRegister();
        }
      }
    }
    print("Response.status code != 200");
    return UserModelRegister();
  }
}
