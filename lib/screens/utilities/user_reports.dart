import 'package:flutter/material.dart';

class UserReports extends StatefulWidget {
  const UserReports({ Key? key }) : super(key: key);

  @override
  _UserReportsState createState() => _UserReportsState();
}

class _UserReportsState extends State<UserReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Reports'),),
      body: Container(
        child: ListView(
          children: [
            Text('No Purchased reports as of now')
          ],
        ),
      ),
    );
  }
}