import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tifac/models/addinnovator.dart';
import 'package:http/http.dart' as http;
import 'package:tifac/screens/homescreen.dart';
import 'utilities/drawer.dart';

class JoinAsInnovators extends StatefulWidget {
  const JoinAsInnovators({Key? key}) : super(key: key);

  @override
  _JoinAsInnovatorsState createState() => _JoinAsInnovatorsState();
}

class _JoinAsInnovatorsState extends State<JoinAsInnovators> {
  double height = 0;
  double width = 0;
  String name = "";
  String email = "";
  String city = "";
  String username = "";
  String designation = "";
  String qualification = "";
  String specification = "";
  String field = "";
  bool loading = false;
  AddInnovator _addInnovator = AddInnovator(success: 0, userid: 0);
  bool alreadyApplied = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: const Text('Join As an Innovator'),
              foregroundColor: Color.fromRGBO(240, 125, 0, 1),
              backgroundColor: Colors.white,
            ),
            body: SizedBox(
              height: height,
              width: width,
              child: ListView(
                children: [
                  // Name field
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
                          labelText: 'Enter your name',
                        ),
                        onChanged: (text) {
                          name = text;
                        },
                      ),
                    ),
                  ),
                  // Email Id
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
                  // Mobile Number
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
                          labelText: 'Enter your mobile number',
                        ),
                        onChanged: (text) {
                          username = text;
                        },
                      ),
                    ),
                  ),
                  // designation
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
                          labelText: 'Your Designation',
                        ),
                        onChanged: (text) {
                          designation = text;
                        },
                      ),
                    ),
                  ),
                  // City
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
                          labelText: 'Enter your City',
                        ),
                        onChanged: (text) {
                          city = text;
                        },
                      ),
                    ),
                  ),

                  // Qualification
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
                          labelText: 'Qualification Details',
                        ),
                        onChanged: (text) {
                          qualification = text;
                        },
                      ),
                    ),
                  ),

                  // Product specification.
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
                          labelText: 'Product Specification',
                        ),
                        onChanged: (text) {
                          specification = text;
                        },
                      ),
                    ),
                  ),

                  // Field Of Innovation
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
                          labelText: 'Field Of Innovation',
                        ),
                        onChanged: (text) {
                          field = text;
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 12,
                    ),
                    child: Container(
                      width: width - 30,
                      alignment: Alignment.center,
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          final AddInnovator addInnovator = await addInnovators(
                              name,
                              email,
                              city,
                              username,
                              designation,
                              qualification,
                              specification,
                              field);
                          setState(() {
                            loading = false;
                            _addInnovator = addInnovator;
                          });
                          if (_addInnovator.success == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const HomeScreen(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const JoinAsInnovators(),
                              ),
                            );
                          }
                        },
                        color: Color.fromRGBO(5, 0, 154, 1),
                        child: const Text(
                          'Join as Innovators',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future<AddInnovator> addInnovators(
      String name,
      String email,
      String city,
      String username,
      String designation,
      String qualification,
      String productspecification,
      String fieldofinnovation) async {
    final String apiUrl = "https://tifac.wipurl.com/index.php/addinnovator";
    Map addInnovator = {
      "name": name,
      "email": email,
      "city": city,
      "designation": designation,
      "qualification": qualification,
      "productspecification": productspecification,
      "fieldofinnovation": fieldofinnovation,
      "username": username
    };
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(addInnovator),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString);
      return addInnovatorFromJson(responseString);
    } else {
      return AddInnovator(success: 0, userid: 0);
    }
  }
}
