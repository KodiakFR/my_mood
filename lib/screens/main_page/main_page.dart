import 'package:flutter/material.dart';
import 'package:my_mood/screens/customs/app_bar_custom.dart';
import 'package:my_mood/screens/main_page/custom_main_page.dart';

import '../widget/navbar.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  
  DateTime dateStart = DateTime.now();
  DateTime dateEnd = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/IMG/testfond3.png"),
          fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const NavBar(),
        appBar: AppBarCustom().backgroundOfAppbar("Welcome"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CustomMainPage().cardCustom("Je souhaite remplir mon questionnaire", Icon(Icons.dynamic_form), "Home", context ),

            CustomMainPage().cardCustom("Récapitulatif de ma synthèse", Icon(Icons.collections_bookmark), "Summarize", context ),


          
          ],
        ),
      ),
    );
  }
}