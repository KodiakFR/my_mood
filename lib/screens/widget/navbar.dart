import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Maxime'),
            accountEmail: const Text('maxime.braud@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://avatars.githubusercontent.com/u/85800785?v=4',
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPOSJKimxYSfYuOMGMoiqyAlV--y-5qtmW7g&usqp=CAU',
                ),
                fit: BoxFit.cover
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Page d\'accueil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
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
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
