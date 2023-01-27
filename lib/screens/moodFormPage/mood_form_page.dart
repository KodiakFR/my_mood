import 'package:flutter/material.dart';
import 'package:my_mood/models/answer_entity.dart';
import 'package:my_mood/screens/widget/navbar.dart';
import 'package:my_mood/services/providers/answer_provider.dart';
import 'package:provider/provider.dart';

import '../customs/app_bar_custom.dart';

class MoodFormPage extends StatefulWidget {
 const MoodFormPage({super.key});

  @override
  State<MoodFormPage> createState() => _MoodFormPageState();
}

class _MoodFormPageState extends State<MoodFormPage> {

  AnswerEntity answersConsummer = AnswerEntity();

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarCustom().backgroundOfAppbar("My mood "),
      body: Center(
        child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top : sizeHeight/25),
            child: const Text("Quelle est la principale cause de ton humeur ?"),   
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal : sizeHeight/35, vertical: sizeHeight/15),
            child: Container(
              color: Colors.black12,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: answersConsummer.moodTypes.length,
                  itemBuilder: ((context, index) {
                  return CheckboxListTile( 
                    title: Text(answersConsummer.moodTypes[index],),
                    value: answersConsummer.boolAnswers[index], 
                    onChanged: (value) {
                      setState(() {
                        answersConsummer.boolAnswers[index] = value!;
                        if(answersConsummer.boolAnswers[index] == true) {
                          context.read<AnswerProvider>().addMoodTypeChoosen(answersConsummer.moodTypes[index]);
                        } 
                        if(answersConsummer.boolAnswers[index] == false)  {
                          context.read<AnswerProvider>().deleteMoodTypeChoosen(answersConsummer.moodTypes[index]);
                        }
                        
                      });
                    }, controlAffinity: ListTileControlAffinity.leading,);
                })),
        ),
          ),
          
          ElevatedButton(onPressed: () {
            
            Navigator.pushReplacementNamed(context, '/WriteForm');
          }, child: const Text("Ok")),
        ],
      )),
    );
  }
}