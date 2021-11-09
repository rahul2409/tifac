import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  double height = 0;
  late SharedPreferences sharedPreferences;
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
        backgroundColor: Color.fromRGBO(5, 0, 154, 1),
      ),
      body: Container(
        height: height,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              ListTile(
                title: Text('Name'),
                subtitle: Text('Rahul nandrajog'),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text('Email'),
                subtitle: Text('rahul@123.com'),
                leading: Icon(Icons.email),
              ),
              ListTile(
                title: Text('City'),
                subtitle: Text('Mumbai'),
                leading: Icon(Icons.house),
              ),
              ListTile(
                title: Text('Mobile Number'),
                subtitle: Text('9619925240'),
                leading:Icon(Icons.phone),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
