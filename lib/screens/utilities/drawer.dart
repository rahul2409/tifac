import 'package:flutter/material.dart';

import '../account.dart';
import '../experts.dart';
import '../innovators.dart';
import '../patents.dart';
import '../report.dart';
import '../training.dart';

class DrawerTifac extends StatelessWidget {
  const DrawerTifac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Intializing the services (About TIFAC, reports, patent filing, Training, Join As Expert, Join As Innovators)
          const UserAccountsDrawerHeader(
            accountName: Text('TIFAC'),
            accountEmail: Text('Useremail@tifac.org.in'),
          ),
          ListTile(
            title: const Text('My Account'),
            onTap: () => _OnPressedNavigate('Accounts', context),
          ),
          ListTile(
            title: const Text('Reports'),
            onTap: () => _OnPressedNavigate('Reports', context),
          ),
          ListTile(
            title: const Text('Patent Filing'),
            onTap: () => _OnPressedNavigate('Patents', context),
          ),
          ListTile(
            title: const Text('Training'),
            onTap: () => _OnPressedNavigate('Training', context),
          ),
          ListTile(
            title: const Text('Join as Experts'),
            onTap: () => _OnPressedNavigate('Expert', context),
          ),
          ListTile(
            title: const Text('Join as Innovators'),
            onTap: () => _OnPressedNavigate('Innovators', context),
          ),
        ],
      ),
    );
  }

  void _OnPressedNavigate(String PageRouteName, BuildContext context) {
    switch (PageRouteName) {
      case 'Accounts':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyAccount();
            },
          ),
        );
        break;
      case 'Reports':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Reports();
            },
          ),
        );
        break;
      case 'Patents':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Patents();
            },
          ),
        );
        break;
      case 'Training':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Training();
            },
          ),
        );
        break;
      case 'Expert':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return JoinAsExpert();
            },
          ),
        );
        break;
      case 'Innovators':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return JoinAsInnovators();
            },
          ),
        );
        break;
    }
  }
}
