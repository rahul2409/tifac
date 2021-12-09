import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FuturisticDisplay extends StatefulWidget {
  final List data;
  final String imageLink;

  const FuturisticDisplay(
      {Key? key, required this.data, required this.imageLink})
      : super(key: key);

  @override
  _FuturisticDisplayState createState() => _FuturisticDisplayState();
}

class _FuturisticDisplayState extends State<FuturisticDisplay> {
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Futuristic Technologies'),
        foregroundColor: const Color.fromRGBO(240, 125, 0, 1),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height / 10,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(widget.imageLink),
                    height: height / 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      widget.data[0],
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              widget.data[1],
            ),
          ),
        ],
      ),
    );
  }
}
