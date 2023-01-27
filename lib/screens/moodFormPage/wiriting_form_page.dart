import 'package:flutter/material.dart';
import 'package:my_mood/services/providers/answer_provider.dart';
import 'package:provider/provider.dart';

import '../../models/answer_entity.dart';
import '../customs/app_bar_custom.dart';

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
       appBar: AppBarCustom().backgroundOfAppbar("My mood test"),
      body: Center(child: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
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
          context.read<AnswerProvider>().addWritingMood(answerMoodController.text);
            // Add nextpath
          }, child: const Text("Ok")),
      ],),),
    );
  }
}