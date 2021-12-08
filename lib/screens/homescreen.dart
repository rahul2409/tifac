import 'package:flutter/material.dart';
import 'package:tifac/screens/about_tifac.dart';
import 'package:tifac/screens/account.dart';
import 'package:tifac/screens/experts.dart';
import 'package:tifac/screens/futuristic_technologies.dart';
import 'package:tifac/screens/home.dart';
import 'package:tifac/screens/innovators.dart';
import 'package:tifac/screens/launch_events.dart';
import 'package:tifac/screens/patents.dart';
import 'package:tifac/screens/report.dart';
import 'package:tifac/screens/services.dart';
import 'package:tifac/screens/training.dart';
import 'package:tifac/screens/utilities/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

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
  int _selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List _widgetOptions = [
    const Home(),
    const Services(),
    const LaunchEvents(),
  ];

  void launchEvents() async {
    const url = 'https://tifac.org.in/index.php/media-corner/events';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if(index == 2) launchEvents();
        print(_selectedIndex);
      });
    }

    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Color.fromRGBO(0, 81, 154, 1),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color.fromRGBO(240, 125, 0, 1),
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(240, 125, 0, 1)))),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Color.fromRGBO(240, 125, 0, 1),
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/TIFAC_Mobile_Application/Bottom_Icons/Home.png',
                height: 40.0,
                // color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Home',
              //  backgroundColor: Color.fromRGBO(5, 0, 154, 1)
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/TIFAC_Mobile_Application/Bottom_Icons/Services.png',
                height: 40.0,
                //    color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/TIFAC_Mobile_Application/Bottom_Icons/Events.png',
                height: 40.0,
                //   color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Events',
            ),
          ],
        ),
      ),
    );
  }
}
