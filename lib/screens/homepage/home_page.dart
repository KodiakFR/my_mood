import 'package:flutter/material.dart';
import 'package:my_mood/screens/homepage/elevatedButton_homepage.dart';
import 'package:my_mood/screens/widget/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("My Mood"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/50),
              child: const Text('Clique sur la méteo qui correspond à ton humeur d\'aujourd\'hui ? ',textAlign: TextAlign.center ,),
            ),
           const ElevatedButton_HomePage(urlImage: 'lib/IMG/sun.png'),
           const ElevatedButton_HomePage(urlImage: 'lib/IMG/cloudy.png'),
           const ElevatedButton_HomePage(urlImage: 'lib/IMG/rainning.png'),
          ],
        ),
      ),
    );
  }
}
