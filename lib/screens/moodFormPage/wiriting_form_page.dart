import 'package:flutter/material.dart';
import 'package:my_mood/services/answer_service.dart';
import 'package:my_mood/services/providers/answer_provider.dart';
import 'package:provider/provider.dart';

import '../../models/answer_entity.dart';
import '../customs/app_bar_custom.dart';
import '../widget/navbar.dart';

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
    var myContext = context.watch<AnswerProvider>().myAnswerEntityProvider;
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarCustom().backgroundOfAppbar("My mood test", ),
      body: Center(child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: sizeHeigth/15),
          child: Text("Ecris quelques lignes sur ton humeur d'aujourd'hui"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sizeWidth/30),
          child: TextFormField(
            controller: answerMoodController,
            decoration:  const InputDecoration(
              border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
            ), 
            minLines: 1,
            maxLines: 10,
          ),
        ), 
      SizedBox(height: sizeHeigth/50,), 
      ElevatedButton(onPressed: () async {
          context.read<AnswerProvider>().addWritingMood(answerMoodController.text);
          if(myContext.writingMood == null || myContext.writingMood!.isEmpty) {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title : Text("You have to write an element to validate", textAlign: TextAlign.center,),
                  actions: <Widget>[
                    TextButton(onPressed: () async{
                      Navigator.of(context).pop();
                    }, child : Text("Ok"),)
                  ],
                ), 
                );
              } 
              else {
                // Add nextpath
              AnswerService().addAnswerFromUser(myContext);
                
                print("validé");
              }
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
           ),
          child: const Text("Ok")),
      ],),),
    );
  }
}