import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AboutTifac extends StatelessWidget {
  const AboutTifac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Tifac'),
        backgroundColor: const Color.fromRGBO(5, 0, 154, 1),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
            child: Text(
                'Technology Information, Forecasting and Assessment Council(TIFAC) is an autonomous body under Department of Science and Technology, Government of India. Since its inception in 1988, TIFAC has been doing significant contribution as a unique knowledge network institution in India. '),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
            child: Text(
                'TIFAC activities encompass a wide array of technology areas and fill a critical gap in the overall S&T system of India. It is mandated to assess the state-of-the-art technologies and sets directions for future areas of research and technological development in key socio-economic sectors.'),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
            child: Text(
                'TIFAC has carried out technology foresight exercises, facilitated and supported technology development, prepared technology linked business opportunity reports and implemented mission-mode programmes. '),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
            child: Container(
              child: Image.asset(
                'assets/Tifac_icons_logo/About_Tifac_1.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
