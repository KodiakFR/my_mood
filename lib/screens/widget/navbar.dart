import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_mood/services/user_services.dart';

UserServices _userServices = UserServices();
final FirebaseAuth _auth = FirebaseAuth.instance;

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(_auth.currentUser!.displayName!),
            accountEmail: Text(_auth.currentUser!.email!),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(_auth.currentUser!.photoURL!),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPOSJKimxYSfYuOMGMoiqyAlV--y-5qtmW7g&usqp=CAU',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Page d\'accueil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/MainPage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.auto_graph_sharp),
            title: const Text('Mon récapitulatif'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Options'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: const Text('Déconnexion'),
            onTap: () {
              _userServices.disconnect();
              Navigator.pushReplacementNamed(context, "/Connection");
            },
          ),
        ],
      ),
    );
  }
}
