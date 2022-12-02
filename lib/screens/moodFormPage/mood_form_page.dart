import 'package:flutter/material.dart';
import 'package:my_mood/screens/widget/navbar.dart';

class MoodFormPage extends StatelessWidget {
  const MoodFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('My Mood'),
      ),
      body: Center(
        child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top : sizeHeight/25),
            child: Text("Quelle est la principale cause de ton humeur ?"),
            

          )
        ],
      )),
    );
  }
}