import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_mood/screens/connection/connection.dart';
import 'package:my_mood/screens/homepage/home_page.dart';
import 'package:my_mood/screens/main_page/main_page.dart';
import 'package:my_mood/screens/moodFormPage/mood_form_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_mood/screens/register/register.dart';
import 'package:my_mood/screens/summarize_answers/summarize_answers.dart';
import 'package:my_mood/services/service_factory.dart';
import 'package:my_mood/services/user_services.dart';
import 'firebase_options.dart';

import 'screens/moodFormPage/wiriting_form_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //si je suis en mode debeug
  if (kDebugMode) {
    // création d'un host pour la plateform Android ou IOS
    final String host = Platform.isAndroid ? "10.0.2.2" : "localhost";

    //Permet la connection à l'émulateur en local
    await FirebaseAuth.instance.useAuthEmulator(
      host,
      9099,
    );

    FirebaseFirestore.instance.useFirestoreEmulator(
      host,
      8080,
    );

    FirebaseFunctions.instance.useFunctionsEmulator(
      host,
      9199,
    );

    FirebaseFunctions.instance.useFunctionsEmulator(
      host,
      5001,
    );
  }
  //permet d'évité du cache dans le FirebaseFirestore
  await FirebaseFirestore.instance.terminate();
  await FirebaseFirestore.instance.clearPersistence();

  runApp(MyApp(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
    firebaseStorage: FirebaseStorage.instance,
    firebaseFunctions: FirebaseFunctions.instance,
  ));
}

final UserServices _userService = UserServices();
final FirebaseAuth _auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  final FirebaseFunctions firebaseFunctions;

  const MyApp(
      {super.key,
      required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.firebaseFunctions,
      required this.firebaseStorage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ServiceFactory(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            "/MoodForm": (context) => const MoodFormPage(),
            "/WriteForm": (context) => WritingFormPage(),
            "/Register": (context) => const Register(),
            "/Connection": (context) => const Connection(),
            "/Home": (context) => const HomePage(),
            "/Summarize": (context) => SummarizeAnswers(),
            "/MainPage" : (context) => MainPage(),
          },
          title: 'My Mood',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StreamBuilder(
            stream: _userService.userConnected,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return MainPage();
                }
                return const Connection();
              }
              return const Scaffold(
                  body: SafeArea(
                      child: Center(
                child: Text('Loading...'),
              )));
            },
          )),
    );
  }
}
