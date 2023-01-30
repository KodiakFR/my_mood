import 'package:flutter/material.dart';
import 'package:my_mood/screens/customs/app_bar_custom.dart';

import '../widget/navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/IMG/testfond2.png"),
          fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const NavBar(),
        appBar: AppBarCustom().backgroundOfAppbar("Welcome"),
        body: Column(
          children: [

           SizedBox(
            width: 500,
            height: 100,
             child: Card(
              color: Colors.transparent,
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Je remplis mon questionnaire: "),
                    TextButton(onPressed: () {
                      Navigator.pushReplacementNamed(context, '/Home');
                    }, child: Text("Je remplis ici"))
                  ],
                ),
             ),
           ),


           SizedBox(
            width: 500,
            height: 100,
             child: Card(
              color: Colors.transparent,
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mes différentes synthèses: "),
                    TextButton(onPressed: () {
                      
                    }, child: Text("Je remplis ici"))
                  ],
                ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}