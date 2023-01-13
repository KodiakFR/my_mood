import 'package:flutter/material.dart';
import 'package:my_mood/screens/models/answer_entity.dart';
import 'package:my_mood/screens/widget/navbar.dart';

class MoodFormPage extends StatefulWidget {
  MoodFormPage({super.key});

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
      appBar: AppBar(
        title: const Text('My Mood'),
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top : sizeHeight/25),
            child: Text("Quelle est la principale cause de ton humeur ?"),   
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
                        print(answersConsummer.boolAnswers[index])  ;
                      });
                    }, controlAffinity: ListTileControlAffinity.leading,);
                })),
        ),
          ),
          
          ElevatedButton(onPressed: () {
            Navigator.pushReplacementNamed(context, '/WriteForm');
          }, child: Text("Ok")),
        ],
      )),
    );
  }
}