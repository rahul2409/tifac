import 'package:flutter/material.dart';
import 'package:tifac/screens/Home.dart';
import 'package:tifac/screens/experts.dart';
import 'package:tifac/screens/innovators.dart';
import 'package:tifac/screens/patents.dart';
import 'package:tifac/screens/report.dart';
import 'package:tifac/screens/training.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
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

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedIndex == 0)
          ? AppBar(
              title: const Text('Services Offered'),
              backgroundColor: Color.fromRGBO(5, 0, 154, 1),
            )
          : null,
      body: (_selectedIndex == 0)
          ? ListView(
              children: [
                Container(
                  color: const Color.fromRGBO(5, 0, 154, 1),
                  child: ListTile(
                    leading: Image.asset('assets/Tifac_icons_logo/Home.png'),
                    title: const Text(
                      'Home Page',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => Home(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(5, 0, 154, 1),
                  child: ListTile(
                    leading: Image.asset('assets/Tifac_icons_logo/Reports.png'),
                    title: const Text(
                      'Reports',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => Reports(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(5, 0, 154, 1),
                  child: ListTile(
                    leading: Image.asset(
                        'assets/Tifac_icons_logo/Patent_filling.png'),
                    title: const Text(
                      'Patent Filling',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => Patents(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(5, 0, 154, 1),
                  child: ListTile(
                    leading:
                        Image.asset('assets/Tifac_icons_logo/Training.png'),
                    title: const Text(
                      'Training',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => Training(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(5, 0, 154, 1),
                  child: ListTile(
                    leading: Image.asset(
                        'assets/Tifac_icons_logo/Join_as_expert.png'),
                    title: const Text(
                      'Join As Expert',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => JoinAsExpert(),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(5, 0, 154, 1),
                  child: ListTile(
                    leading: Image.asset(
                        'assets/Tifac_icons_logo/Join_as_Innovator.png'),
                    title: const Text(
                      'Join As Innovator',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => JoinAsInnovators(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Color.fromRGBO(5, 0, 154, 1),
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Tifac_icons_logo/Home.png',
              height: 40.0,
              color: Color.fromRGBO(5, 0, 154, 1),
              width: 40.0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Tifac_icons_logo/Reports.png',
              height: 40.0,
              color: Color.fromRGBO(5, 0, 154, 1),
              width: 40.0,
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Tifac_icons_logo/Patent_filling.png',
              height: 40.0,
              color: Color.fromRGBO(5, 0, 154, 1),
              width: 40.0,
            ),
            label: 'Patent Filing',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Tifac_icons_logo/Training.png',
              height: 40.0,
              color: Color.fromRGBO(5, 0, 154, 1),
              width: 40.0,
            ),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Tifac_icons_logo/Join_as_expert.png',
              height: 40.0,
              color: Color.fromRGBO(5, 0, 154, 1),
              width: 40.0,
            ),
            label: 'Experts',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Tifac_icons_logo/Join_as_Innovator.png',
              height: 40.0,
              color: Color.fromRGBO(5, 0, 154, 1),
              width: 40.0,
            ),
            label: 'Innovators',
          ),
        ],
      ),
    );
  }
}
