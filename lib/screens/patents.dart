import 'package:flutter/material.dart';

import 'utilities/drawer.dart';

class Patents extends StatefulWidget {
  const Patents({ Key? key }) : super(key: key);

  @override
  _PatentsState createState() => _PatentsState();
}

class _PatentsState extends State<Patents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patent Filing'),),
      drawer: DrawerTifac(),
    );
  }
}