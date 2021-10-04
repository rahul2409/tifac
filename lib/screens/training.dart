import 'package:flutter/material.dart';

import 'utilities/drawer.dart';

class Training extends StatefulWidget {
  const Training({ Key? key }) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Training'),),
      drawer: DrawerTifac(),
      body: Container(
        child: Center(
          child: Text('Coming Soon...', style: TextStyle(fontSize: height/20),),
        ),
      ),
    );
  }
}