import 'package:flutter/material.dart';

import 'utilities/drawer.dart';

class Patents extends StatefulWidget {
  const Patents({Key? key}) : super(key: key);

  @override
  _PatentsState createState() => _PatentsState();
}

class _PatentsState extends State<Patents> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Patent Filing'),
        foregroundColor: const Color.fromRGBO(219, 115, 14, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TIFAC_Mobile_Application/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Coming Soon...',
            style: TextStyle(fontSize: height / 20),
          ),
        ),
      ),
    );
  }
}
