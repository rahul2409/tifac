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
        title: Text('TIFAC'),
      ),
      drawer: DrawerTifac(),
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
            ],
          ),
        ),
      ),
    );
  }
}
