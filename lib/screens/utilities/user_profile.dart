import 'package:flutter/material.dart';
import 'package:tifac/screens/signup.dart';
import 'package:tifac/screens/utilities/user_data.dart';
import 'package:tifac/screens/utilities/user_reports.dart';
import 'package:tifac/services/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  double height = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        backgroundColor: const Color.fromRGBO(5, 0, 154, 1),
      ),
      body: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              ListTile(
                title: const Text('User Profile'),
                subtitle: const Text('Tap to get User Details'),
                leading: const Icon(Icons.person),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const User(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('My Reports'),
                subtitle: const Text('rahul@123.com'),
                leading: const Icon(Icons.note),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const UserReports(),
                    ),
                  );
                },
              ),
              SizedBox(
                width: 50,
                child: MaterialButton(
                  onPressed: () async {
                    await UserSharedPreferences.clear();
                    if (UserSharedPreferences.getUsername() == '') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => SignUpPage(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: const Color.fromRGBO(5, 0, 154, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
