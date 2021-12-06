import 'package:flutter/material.dart';
import 'package:tifac/screens/Home.dart';
import 'package:tifac/screens/experts.dart';
import 'package:tifac/screens/homescreen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedIndex == 0)
          ? AppBar(
              title: const Text('Services Offered'),
              backgroundColor: Colors.white,
              foregroundColor: Color.fromRGBO(219, 115, 14, 1),
            )
          : null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TIFAC_Mobile_Application/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Container(
              child: ListTile(
                leading: Image.asset(
                  'assets/Tifac_icons_logo/Reports.png',
                  color: Color.fromRGBO(219, 115, 14, 1),
                ),
                title: const Text(
                  'Reports',
                  style: TextStyle(
                    color: Color.fromRGBO(219, 115, 14, 1),
                  ),
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
              child: ListTile(
                leading: Image.asset(
                  'assets/Tifac_icons_logo/Patent_filling.png',
                  color: Color.fromRGBO(219, 115, 14, 1),
                ),
                title: const Text(
                  'Patent Filling',
                  style: TextStyle(
                    color: Color.fromRGBO(219, 115, 14, 1),
                  ),
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
              child: ListTile(
                leading: Image.asset(
                  'assets/Tifac_icons_logo/Training.png',
                  color: Color.fromRGBO(219, 115, 14, 1),
                ),
                title: const Text(
                  'Training',
                  style: TextStyle(
                    color: Color.fromRGBO(219, 115, 14, 1),
                  ),
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
              child: ListTile(
                leading: Image.asset(
                  'assets/Tifac_icons_logo/Join_as_expert.png',
                  color: Color.fromRGBO(219, 115, 14, 1),
                ),
                title: const Text(
                  'Join As Expert',
                  style: TextStyle(
                    color: Color.fromRGBO(219, 115, 14, 1),
                  ),
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
              child: ListTile(
                leading: Image.asset(
                  'assets/Tifac_icons_logo/Join_as_Innovator.png',
                  color: Color.fromRGBO(219, 115, 14, 1),
                ),
                title: const Text(
                  'Join As Innovator',
                  style: TextStyle(
                    color: Color.fromRGBO(219, 115, 14, 1),
                  ),
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
        ),
      ),
    );
  }
}
