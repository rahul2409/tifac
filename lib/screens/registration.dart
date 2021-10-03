import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:tifac/screens/homescreen.dart';
import 'package:tifac/screens/signup.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
} 

class _RegistrationPageState extends State<RegistrationPage> {
  String name = "";
  String email = "";
  double height = 0;
  double width = 0;
  String number = "";
  void _OnPressedRegister() {
    // Register the client here.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
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
                    decoration: InputDecoration(
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
                      number = text;
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your email address',
                    ),
                    onChanged: (text) {
                      email = text;
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
                  onPressed: () => _OnPressedRegister(),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(
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
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Registered?'),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: Text('Sign In Here'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
