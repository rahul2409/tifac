import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchEvents extends StatefulWidget {
  const LaunchEvents({Key? key}) : super(key: key);

  @override
  _LaunchEventsState createState() => _LaunchEventsState();
}

class _LaunchEventsState extends State<LaunchEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        backgroundColor: Colors.white,
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
          child: MaterialButton(
            onPressed: () async {
              const url = 'https://tifac.org.in/index.php/media-corner/events';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const Text(
              'Go To Events',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Color.fromRGBO(9, 0, 215, 1),
          ),
        ),
      ),
    );
  }
}
