import 'package:flutter/material.dart';

class FuturisticTechno extends StatelessWidget {
  const FuturisticTechno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Futuristic Technologies'),
        backgroundColor: const Color.fromRGBO(5, 0, 154, 1),
      ),
      body: Container(
        child: Image.asset('assets/Tifac_icons_logo/future_technology_1.png'),
      ),
    );
  }
}
