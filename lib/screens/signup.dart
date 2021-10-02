import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  String name = "";
  String email = "";
  String number = "";
  double height = 0;
  bool apiCall = false;
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (apiCall) {
      return CircularProgressIndicator();
    } else {
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
                      decoration: InputDecoration(
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
                    onPressed: () => _OnPressedSendOTP(),
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(
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
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('New User?'),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Register Here.'),
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

  void _OnPressedSendOTP() {
    // API call to fetch the otp and save it in pin.
    setState(() {
      apiCall = true;
    });
    // Function call to get the the OTP
    _GetOTP();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: height / 3,
          child: Column(
            children: [
              Padding(
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
                            title: Text('Pin'),
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
  void _GetOTP(){
    
  }
}
