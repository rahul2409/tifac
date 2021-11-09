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
        backgroundColor: Color.fromRGBO(5, 0, 154, 1),
        title: Text('Patent Filing'),
      ),
      body: Container(
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
