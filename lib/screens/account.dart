import 'package:flutter/material.dart';
import 'package:tifac/screens/utilities/drawer.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({ Key? key }) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Account'),),
      drawer: const DrawerTifac(),
    );
  }
}