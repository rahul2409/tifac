import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tifac/screens/utilities/user_data.dart';
import 'package:tifac/screens/utilities/user_reports.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  double height = 0;
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
                title: Text('User Profile'),
                subtitle: Text('Tap to get User Details'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => User(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('My Reports'),
                subtitle: Text('rahul@123.com'),
                leading: Icon(Icons.note),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => UserReports(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
