import 'package:flutter/material.dart';
import 'package:my_mood/screens/widget/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("My Mood"),
      ),
    );
  }
}
