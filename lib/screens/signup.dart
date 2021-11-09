import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:tifac/models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:tifac/screens/homescreen.dart';
import 'package:tifac/screens/registration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  String email = "";
  String number = "";
  double height = 0;
  bool apiCall = false;
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
                      labelText: 'Enter your registered mobile Number',
                    ),
                    onChanged: (text) {
                      number = text;
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
                      apiCall = true;
                    });
                    // ignore: todo
                    // TODO: Get OTP. Check the api call and sign in the user use shared preference.
                    // _OnPressedSendOTP();
                    UserModel response = await signInUser("91" + number);
                    setState(() {
                      apiCall = false;
                    });
                    if (response.success == 1) {
                      // Add shared preference
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
                  },
                  color: Colors.blue,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Get OTP",
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
                            builder: (builder) => RegistrationPage(),
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
    print(number);
    Map encodeNumber = {
      "username": number,
    };
    print(jsonEncode(encodeNumber));
    final response = await http.post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(encodeNumber));

    if (response.statusCode == 200) {
      // The response is okay and can be processed.
      print(response.toString());
      final responseString = response.body;
      print(responseString);
      final userModelFromResponse = userModelFromJson(responseString);
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

  void onPressedSendOTP() {
    // API call to fetch the otp and save it in pin.
    setState(() {
      apiCall = true;
    });
    // Function call to get the the OTP
    getOTP();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: height / 3,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 40.0,
                ),
                child: Text('Enter the OTP'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: PinEntryTextField(
                  showFieldAsBox: true,
                  onSubmit: (String pin) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Pin'),
                            content: Text('Pin entered as $pin'),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void getOTP() {}
}
