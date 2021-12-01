import 'package:flutter/material.dart';
import 'package:tifac/screens/about_tifac.dart';
import 'package:tifac/screens/account.dart';
import 'package:tifac/screens/experts.dart';
import 'package:tifac/screens/futuristic_technologies.dart';
import 'package:tifac/screens/home.dart';
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
  int _selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List _widgetOptions = [
    const Home(),
    const Reports(),
    const Patents(),
    const Training(),
    const JoinAsExpert(),
    const JoinAsInnovators(),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        print(_selectedIndex);
      });
    }

    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Color.fromRGBO(0, 81, 154, 1),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color.fromRGBO(240, 125, 0, 1),
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(color: Color.fromRGBO(240, 125, 0, 1)))),
        child: new BottomNavigationBar(
          currentIndex: _selectedIndex,
          // backgroundColor: Color.fromRGBO(240, 125, 0, 1),
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Tifac_icons_logo/Home.png',
                height: 40.0,
                // color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Home',
              //  backgroundColor: Color.fromRGBO(5, 0, 154, 1)
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Tifac_icons_logo/Reports.png',
                height: 40.0,
                //    color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Tifac_icons_logo/Patent_filling.png',
                height: 40.0,
                //   color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Patent Filing',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Tifac_icons_logo/Training.png',
                height: 40.0,
                //   color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Training',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Tifac_icons_logo/Join_as_expert.png',
                height: 40.0,
                //    color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Experts',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Tifac_icons_logo/Join_as_Innovator.png',
                height: 40.0,
                //   color: Color.fromRGBO(5, 0, 154, 1),
                width: 40.0,
              ),
              label: 'Innovators',
            ),
          ],
        ),
      ),
    );
  }
}
