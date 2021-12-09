// ignore: file_names

import 'package:flutter/material.dart';
import 'package:tifac/screens/about_tifac.dart';
import 'package:tifac/screens/futuristic_technologies.dart';
import 'package:tifac/screens/futuristic_technology_display.dart';
import 'package:tifac/screens/services.dart';
import 'package:tifac/screens/utilities/user_profile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dummyData = [
    [
      'Plasmonics:',
      'Plasmonics combines the best aspects of optical and electronic data transfer. Bycrowding light into metal structures with dimensions far smaller than its wavelength, data can be transmitted at much higher frequencies such as terahertz frequencies, whichlie between microwaves and infrared light. Terahertz imaging is useful for non-destructive testing, such as detection of anthrax bacterial weapons in packaging or examination of insulation in spacecraft. It shows potential to make wireless devices 1,000 times faster than they are today.'
    ],
    [
      'Bionic leaf:',
      'Bionic leaf that creates its own fertilizer to boost new green revolution. Bionic leaf that uses bacteria, sunlight, water and air to make fertilizer in the very soil where crops are grown. It will play vital role in kick-starting a new ‘green revolution’'
    ],
    [
      'Synthetic Biology: ',
      'Synthetic biology (or “Synbio”) refers to the design and fabrication of novel biologicalparts, devices and systems that do not otherwise occur in nature. Many see it as anextreme version of genetic engineering (GE). But unlike GE, whereby genetic information with certain desirable traits is inserted from one organism into another, synbio uses computers and chemicals to create entirely new organisms.'
    ],
    [
      'Bio-mimetic:',
      'Bio-mimetic refers to human-made models, processes, substances, devices, or systemsthat imitate nature. The emerging field of biomimetics could give rise to new technologies created from biologically inspired products at both the macro scale andnanoscale levels with properties such as self-healing abilities, environmental exposuretolerance and resistance, hydrophobicity, self-assembly, and harnessing solar energy'
    ],
    [
      'Brain Computer Interface: ',
      'It is sometimes called a direct neural interface (DNI), synthetic telepathy interface(STI) or a brain–machine interface (BMI) - a direct communication pathway between the brain and an external device for assisting, augmenting, or repairing human cognitiveor sensory-motor functions.'
    ],
    [
      'Enernet:',
      'A smart grid that is similar to Internet that supports uploading, downloading andstorage of energy rather than bits.'
    ],
    [
      'Robotic bees for pollination:',
      'By imitating some of the complex wing motion patterns and aerodynamics of bees and flies embedded with sensors, can create swarms of bee-like drones or robotic bees to pollinate plants when the real-life insects / bees go extinct.'
    ],
    [
      'Molecular Manufacturing:',
      ' Molecular manufacturing is a method for the processing and rearrangement of atoms tofabricate custom products built to atomic specification that exhibit order-of-magnitude improvements in strength, toughness, speed, efficiency etc.'
    ],
    [
      'Hearables:',
      'In-hear computing - Hearables for the screen-free future.  Hearables have been touted as the next big thing for wearables. The hearable is actually the precipice of the very beginning of the start of fourth-platform computing. The true promise of hearables lies in their ability to interact with the increasingly connected world around us, and remove many of the increasingly prevalent screens that would be less intrusive and more able to respond to our needs.'
    ],
    [
      'Immersive Virtual reality:',
      'It consists of immersion in an artificial environment where the user feels just asimmersed as they usually feel in consensus reality e.g. Panoramic 3D displays (visual),Surround sound acoustics (auditory), Haptics and force feedback (tactile), Smellreplication (olfactory), Taste replication (gustation) etc.'
    ],
  ];
  double height = 0;
  CarouselController controller = CarouselController();
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // foregroundColor: Color.fromRGBO(240, 125, 0, 1),
        // foregroundColor: Color.fromRGBO(5, 0, 154, 1),
        //  foregroundColor: Color(0xf07d00),
        leading: Image.asset('assets/tifactoplogo.jpg'),

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TIFAC_Mobile_Application/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        height: height,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Image Of the Login Screen
              Container(
                padding: const EdgeInsets.all(5.0),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Technology Information, Forecasting and Assessment Council(TIFAC) is an autonomous body under Department of Science and Technology, Government of India.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Center(
                child: MaterialButton(
                  child: const Text(
                    'Read More',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: const Color.fromRGBO(9, 0, 214, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => AboutTifac(),
                      ),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      color: const Color.fromRGBO(219, 115, 14, 1),
                    ),
                  ),
                ],
              ),

              CarouselSlider(
                items: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[0],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Plasmonics.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Plasmonics.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('Plasmonics'),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[1],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Bionic-Leaf.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Bionic-Leaf.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('Bionic Leaf'),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[2],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Synthetic-Biology.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Synthetic-Biology.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('Synthetic Biology'),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[3],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Biomimetics.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Biomimetics.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text('Biomimetics'),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[4],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Brain-Computer-Interface.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Brain-Computer-Interface.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'Brain Computer Interface',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[5],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Enernet.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Enernet.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'Enernet',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[6],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Robotic-Bees.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Robotic-Bees.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'Robotic Bees',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[7],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Molucular-Manufacturing.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Molucular-Manufacturing.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'Molucular ...',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[8],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Hearables.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Hearables.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'Hearables',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) => FuturisticDisplay(
                                          data: dummyData[9],
                                          imageLink:
                                              'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Immersive-Virtual-Reality.png',
                                        ),
                                      ),
                                    );
                                  },
                                  iconSize: height / 11,
                                  icon: Image.asset(
                                    'assets/TIFAC_Mobile_Application/Futuristic_Technologies_Icon/Immersive-Virtual-Reality.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'Immersive Virtual Reality',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                carouselController: controller,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  height: height / 3,
                ),
              ),

              // SafeArea(
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 250,
              //     child: GridView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: dummyData.length,
              //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //           maxCrossAxisExtent: width),
              //       itemBuilder: (context, index) {
              //         if (index % 2 == 0) {
              //           return GridTile(
              //             child: Padding(
              //               padding: EdgeInsets.all(5.0),
              //               child: Container(
              //                 // color: Color.fromRGBO(5, 0, 154, 1),
              //                 color: Color.fromRGBO(0, 143, 61, 1),
              //                 child: Padding(
              //                   padding: EdgeInsets.only(left: 5.0, right: 5.0),
              //                   child: Text(
              //                     dummyData[index],
              //                     style: TextStyle(
              //                         color: Color.fromRGBO(240, 125, 0, 1)),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           );
              //         } else {
              //           return GridTile(
              //             child: Padding(
              //               padding: EdgeInsets.all(5.0),
              //               child: Container(
              //                 // color: Color.fromRGBO(5, 0, 154, 1),
              //                 color: Color.fromRGBO(0, 81, 154, 1),
              //                 child: Padding(
              //                   padding: EdgeInsets.only(left: 5.0, right: 5.0),
              //                   child: Text(
              //                     dummyData[index],
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           );
              //         }
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
