import 'package:flutter/material.dart';
import 'package:my_mood/models/answer_entity.dart';
import 'package:my_mood/screens/widget/navbar.dart';
import 'package:my_mood/services/providers/answer_provider.dart';
import 'package:my_mood/viewModels/answer_list_vm.dart';
import 'package:provider/provider.dart';

import '../customs/app_bar_custom.dart';

class MoodFormPage extends StatefulWidget {
 const MoodFormPage({super.key});

  @override
  State<MoodFormPage> createState() => _MoodFormPageState();
}

class _MoodFormPageState extends State<MoodFormPage> {

  AnswerEntity answersConsummer = AnswerEntity();
  AnswerListVM answerList = AnswerListVM();

  @override
  Widget build(BuildContext context) {
    var myContext = context.watch<AnswerProvider>().myAnswerEntityProvider;
    var sizeHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;
    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    );
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarCustom().backgroundOfAppbar("My mood ", ),
      body: Center(
        child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top : sizeHeight/25),
            child: const Text("Quelle est la principale cause de ton humeur ?"),   
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal : sizeHeight/35, vertical: sizeHeight/15),
                child: ListView.builder(    
                    shrinkWrap: true,
                    itemCount: answerList.moodTypes.length,
                    itemBuilder: ((context, index) {
                    return Theme(
                      data: theme.copyWith(checkboxTheme: newCheckBoxTheme),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: CheckboxListTile(    
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(color: Color.fromARGB(255, 5, 0, 2)),
                            ),
                          
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          tileColor: Colors.indigo[400],
                          selected: answerList.boolAnswers[index],
                          title: Text(answerList.moodTypes[index], textAlign: TextAlign.center ),
                          value: answerList.boolAnswers[index], 
                          onChanged: (value) {
                            setState(() {
                              answerList.boolAnswers[index] = value!;
                              if(answerList.boolAnswers[index] == true) {
                                context.read<AnswerProvider>().addMoodTypeChoosen(answerList.moodTypes[index]);
                              } 
                              if(answerList.boolAnswers[index] == false)  {
                                context.read<AnswerProvider>().deleteMoodTypeChoosen(answerList.moodTypes[index]);
                              }
                              
                            });
                          }, controlAffinity: ListTileControlAffinity.leading,),
                      ),
                    );
                  })),
             
          ),
          
          ElevatedButton(
            onPressed: () {
              if(myContext.moodTypeChoose == null || myContext.moodTypeChoose!.isEmpty) {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title : const Text("You have to choose one element minimum", textAlign: TextAlign.center,),
                  actions: <Widget>[
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child : const Text("Ok"),)
                  ],
                ), 
                );
              } else {
                Navigator.pushReplacementNamed(context, '/WriteForm');
              }

            
          },
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
           ),
           child: const Text("Ok")
          ),
        ],
      )),
    );
  }
}