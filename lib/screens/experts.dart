import 'package:flutter/material.dart';
import 'package:tifac/screens/utilities/drawer.dart';

class JoinAsExpert extends StatefulWidget {
  const JoinAsExpert({Key? key}) : super(key: key);

  @override
  _JoinAsExpertState createState() => _JoinAsExpertState();
}

class _JoinAsExpertState extends State<JoinAsExpert> {
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
        title: const Text('Join As an Expert'),
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
                child: MaterialButton(
                  onPressed: () => onPressedJoinAsExpert(),
                  color: Colors.blue,
                  child: const Text(
                    'Join as Expert',
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

  void onPressedJoinAsExpert() {}
}
