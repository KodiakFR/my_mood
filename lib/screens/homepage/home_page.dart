import 'package:flutter/material.dart';
import 'package:my_mood/screens/customs/app_bar_custom.dart';
import 'package:my_mood/screens/homepage/elevated_button_homepage.dart';
import 'package:my_mood/screens/widget/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarCustom().backgroundOfAppbar("My mood ", ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           const Text('Clique sur la méteo qui correspond à ton humeur d\'aujourd\'hui ? ', textAlign: TextAlign.center,),
           ElevatedButtonHomePage(urlImage: 'lib/IMG/sun.png', weatherF: "Good mood"),
           ElevatedButtonHomePage(urlImage: 'lib/IMG/cloudy.png', weatherF: "average mood",),
           ElevatedButtonHomePage(urlImage: 'lib/IMG/rainning.png', weatherF: "sad mood",),
          ],
        ),
      ),
    );
  }
}
