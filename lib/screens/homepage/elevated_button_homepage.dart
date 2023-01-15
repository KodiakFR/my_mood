import 'package:flutter/material.dart';

class ElevatedButtonHomePage extends StatelessWidget {
  final String urlImage;
  const ElevatedButtonHomePage({
    required this.urlImage,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.black.withOpacity(0))
              ,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/MoodForm');
              },
              child: Image.asset(
                urlImage,
                height: 150,
                width: 150,
              ),
            );
  }
}