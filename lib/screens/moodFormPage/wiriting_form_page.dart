import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/answer_entity.dart';

class WritingFormPage extends StatelessWidget {
  WritingFormPage({super.key});

  final answerMoodController = TextEditingController();
  AnswerEntity answersConsummer = AnswerEntity();

  @override
  void dispose() {
    answerMoodController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(), 
      body: Center(child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Text("Ecris quelques lignes sur ton humeur d'aujourd'hui"),
        ),
        TextFormField(
          controller: answerMoodController,
          decoration:  const InputDecoration(
            border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
          ),
        ),  
      ElevatedButton(onPressed: () {
          answersConsummer.writingMood = answerMoodController.text;
            // Add nextpath
          }, child: Text("Ok")),
      ],),),
    );
  }
}