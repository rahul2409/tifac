import 'package:flutter/material.dart';
import 'package:tifac/services/shared_preferences.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  String city = "";
  String email = "";
  String username = "";
  int userId = 0;
  String name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = UserSharedPreferences.getName() ?? '';
    username = UserSharedPreferences.getUsername() ?? '';
    city = UserSharedPreferences.getCity() ?? '';
    email = UserSharedPreferences.getEmail() ?? '';
    userId = UserSharedPreferences.getUserId() ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Account Information'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('UserName'),
            subtitle: Text(name),
          ),
          ListTile(
            title: const Text('Mobile Number '),
            subtitle: Text(username),
          ),
          ListTile(
            title: const Text('email'),
            subtitle: Text(email),
          ),
          ListTile(
            title: const Text('City'),
            subtitle: Text(city),
          ),
        ],
      ),
    );
  }
}
