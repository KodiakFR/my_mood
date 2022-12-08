import 'package:flutter/material.dart';
import 'package:my_mood/screens/homepage/home_page.dart';
import 'package:my_mood/screens/moodFormPage/mood_form_page.dart';

import 'screens/moodFormPage/wiriting_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
          "/MoodForm":(context) => MoodFormPage(),
          "/WriteForm":(context) => WritingFormPage(),
      },
      title: 'My Mood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

