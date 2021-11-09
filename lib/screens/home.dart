// ignore: file_names

import 'package:flutter/material.dart';
import 'package:tifac/screens/about_tifac.dart';
import 'package:tifac/screens/futuristic_technologies.dart';
import 'package:tifac/screens/services.dart';
import 'package:tifac/screens/utilities/user_profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dummyData = [
    '\n\nRobotic bees for pollination: \n\nBy imitating some of the complex wing motion patterns and aerodynamics of bees and flies embedded with sensors, can create swarms of bee-like drones or robotic bees to pollinate plants when the real-life insects / bees go extinct.',
    '\n\nBionic leaf: \n\nBionic leaf that creates its own fertilizer to boost new green revolution. Bionic leaf that uses bacteria, sunlight, water and air to make fertilizer in the very soil where crops are grown. It will play vital role in kick-starting a new ‘green revolution’',
    '\n\nHearables: \n\nIn-hear computing - Hearables for the screen-free future.  Hearables have been touted as the next big thing for wearables. The hearable is actually the precipice of the very beginning of the start of fourth-platform computing. The true promise of hearables lies in their ability to interact with the increasingly connected world around us, and remove many of the increasingly prevalent screens that would be less intrusive and more able to respond to our needs.',
    '\n\nBrain Computer Interface: \n\nIt is sometimes called a direct neural interface (DNI), synthetic telepathy interface(STI) or a brain–machine interface (BMI) - a direct communication pathway between the brain and an external device for assisting, augmenting, or repairing human cognitiveor sensory-motor functions.',
    '\n\nMolecular Manufacturing: \n\nMolecular manufacturing is a method for the processing and rearrangement of atoms tofabricate custom products built to atomic specification that exhibit order-of-magnitude improvements in strength, toughness, speed, efficiency etc.',
    '\n\nSynthetic Biology: \n\nSynthetic biology (or “Synbio”) refers to the design and fabrication of novel biologicalparts, devices and systems that do not otherwise occur in nature. Many see it as anextreme version of genetic engineering (GE). But unlike GE, whereby genetic information with certain desirable traits is inserted from one organism into another, synbio uses computers and chemicals to create entirely new organisms.',
    '\n\nImmersive Virtual reality: \n\nIt consists of immersion in an artificial environment where the user feels just asimmersed as they usually feel in consensus reality e.g. Panoramic 3D displays (visual),Surround sound acoustics (auditory), Haptics and force feedback (tactile), Smellreplication (olfactory), Taste replication (gustation) etc.',
    '\n\nBio-mimetic: \n\nBio-mimetic refers to human-made models, processes, substances, devices, or systemsthat imitate nature. The emerging field of biomimetics could give rise to new technologies created from biologically inspired products at both the macro scale andnanoscale levels with properties such as self-healing abilities, environmental exposuretolerance and resistance, hydrophobicity, self-assembly, and harnessing solar energy',
    '\n\nEnernet: \n\nA smart grid that is similar to Internet that supports uploading, downloading andstorage of energy rather than bits.',
    '\n\nPlasmonics: \n\nPlasmonics combines the best aspects of optical and electronic data transfer. Bycrowding light into metal structures with dimensions far smaller than its wavelength, data can be transmitted at much higher frequencies such as terahertz frequencies, whichlie between microwaves and infrared light. Terahertz imaging is useful for non-destructive testing, such as detection of anthrax bacterial weapons in packaging or examination of insulation in spacecraft. It shows potential to make wireless devices 1,000 times faster than they are today.'
  ];
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color.fromRGBO(5, 0, 154, 1),
        leading: Image.asset('assets/tifac_logo.png'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/Tifac_icons_logo/Notification_icon.png',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => UserProfile(),
                ),
              );
            },
            icon: Image.asset(
              'assets/Tifac_icons_logo/Profile_icon.png',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Image Of the Login Screen
            Container(
              padding: const EdgeInsets.all(12.0),
              color: const Color.fromRGBO(5, 0, 154, 1),
              child: ListTile(
                title: const Text(
                  'TIFAC',
                  style: TextStyle(color: Colors.white),
                ),
                isThreeLine: true,
                contentPadding: const EdgeInsets.all(10),
                subtitle: const Text(
                  'Technology Information, Forecasting and Assessment Council(TIFAC) is an autonomous body under Department of Science and Technology, Government of India. Since its inception in 1988, TIFAC has been doing significant contribution as a unique knowledge network institution in India.',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const AboutTifac(),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => const FuturisticTechno(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'Futuristic Technologies',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color.fromRGBO(5, 0, 154, 1),
                  ),
                ),
              ],
            ),

            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 350,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyData.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: width),
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          color: Color.fromRGBO(5, 0, 154, 1),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                              dummyData[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Services()));
                    },
                    child: const Text(
                      'Services',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Color.fromRGBO(5, 0, 154, 1),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Events',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Color.fromRGBO(5, 0, 154, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
