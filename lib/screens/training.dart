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
    return Scaffold(
      appBar: AppBar(title: Text('Training'),),
      drawer: DrawerTifac(),
    );
  }
}