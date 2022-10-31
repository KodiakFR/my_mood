import 'package:flutter/material.dart';
import 'package:my_mood/screens/widget/navbar.dart';

class MoodFormPage extends StatelessWidget {
  const MoodFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('My Mood'),
      ),
      body: Center(child: Column(
        children: [
        
        ],
      )),
    );
  }
}