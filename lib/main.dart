import 'package:flutter/material.dart';
import 'package:tifac/screens/homescreen.dart';
import 'package:tifac/screens/signup.dart';
import 'package:tifac/services/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String name = "";

    String email = "";
    String number = "";
    String city = "";
    int userId = 0;
    city = UserSharedPreferences.getCity() ?? '';
    name = UserSharedPreferences.getName() ?? '';
    number = UserSharedPreferences.getUsername() ?? '';
    email = UserSharedPreferences.getEmail() ?? '';
    userId = UserSharedPreferences.getUserId() ?? -1;
    print("${city}, ${name}, ${number}, ${email}, ${userId}");
    if (city != '' &&
        name != '' &&
        number != '' &&
        email != '' &&
        userId != -1) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUpPage(),
      );
    }
  }
}
