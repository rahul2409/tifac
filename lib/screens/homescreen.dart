import 'package:flutter/material.dart';
import 'package:tifac/screens/account.dart';
import 'package:tifac/screens/experts.dart';
import 'package:tifac/screens/innovators.dart';
import 'package:tifac/screens/patents.dart';
import 'package:tifac/screens/report.dart';
import 'package:tifac/screens/training.dart';
import 'package:tifac/screens/utilities/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  String name = "";
  String email = "";
  double height = 0;
  double width = 0;
  String number = "";
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color.fromRGBO(5, 0, 154, 1),
        leading: Image.asset('assets/tifac_logo.png'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/Tifac_icons_logo/Notification_icon.png',
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/Tifac_icons_logo/Profile_icon.png',
            ),
          ),
        ],
      ),
      drawer: const DrawerTifac(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Image Of the Login Screen
            Container(
              padding: const EdgeInsets.all(12.0),
              color: const Color.fromRGBO(5, 0, 154, 1),
              child: const ListTile(
                title: Text(
                  'TIFAC',
                  style: TextStyle(color: Colors.white),
                ),
                isThreeLine: true,
                contentPadding: EdgeInsets.all(10),
                subtitle: Text(
                  'Technology Information, Forecasting and Assessment Council(TIFAC) is an autonomous body under Department of Science and Technology, Government of India. Since its inception in 1988, TIFAC has been doing significant contribution as a unique knowledge network institution in India.',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
