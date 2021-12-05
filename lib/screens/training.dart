import 'package:flutter/material.dart';

import 'utilities/drawer.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Training'),
        backgroundColor: Colors.white,
        foregroundColor: Color.fromRGBO(219, 115, 14, 1),
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
