import 'package:flutter/material.dart';

import 'utilities/drawer.dart';

class JoinAsInnovators extends StatefulWidget {
  const JoinAsInnovators({Key? key}) : super(key: key);

  @override
  _JoinAsInnovatorsState createState() => _JoinAsInnovatorsState();
}

class _JoinAsInnovatorsState extends State<JoinAsInnovators> {
  double height = 0;
  double width = 0;
  String name = "";
  String categoryChoice = "One";
  bool alreadyApplied = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join As an Innovator'),
      ),
      drawer: const DrawerTifac(),
      body: SizedBox(
        height: height,
        width: width,
        child: ListView(
          children: [
            // Name field
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                  onChanged: (text) {
                    name = text;
                  },
                ),
              ),
            ),
            // Email Id
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email address',
                  ),
                  onChanged: (text) {
                    name = text;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your mobile number',
                  ),
                  onChanged: (text) {
                    name = text;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Innovation details',
                  ),
                  onChanged: (text) {
                    name = text;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: TextField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Address',
                  ),
                  onChanged: (text) {
                    name = text;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  value: categoryChoice,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      categoryChoice = newValue!;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: alreadyApplied,
                      onChanged: (bool? alreadyApply) {
                        setState(() {
                          alreadyApplied = alreadyApply!;
                        });
                      },
                    ),
                    const Text('Already Applied?'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
              ),
              child: Container(
                width: width - 30,
                alignment: Alignment.center,
                child: MaterialButton(
                  onPressed: () => onPressedJoinAsInnovators(),
                  color: Colors.blue,
                  child: const Text(
                    'Join as Innovators',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedJoinAsInnovators() {}
}
