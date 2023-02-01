import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_mood/models/answer_entity.dart';
import 'package:my_mood/services/answer_service.dart';

class SummarizeAnswers extends StatefulWidget {
  SummarizeAnswers({Key? key}) : super(key: key);
  

  @override
  State<SummarizeAnswers> createState() => _SummarizeAnswersState();
}
  
  DateTime dateStart = DateTime.now();
  DateTime dateEnd = DateTime.now();

class _SummarizeAnswersState extends State<SummarizeAnswers> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AnswerService().getSummarizeAnswer,
      builder: (context, snapshot) {
        if(snapshot.hasError){
               return const Text('Erreur lors de la récuparation data 1');
             }
            if (snapshot.connectionState ==  ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
                var value = snapshot.data!;              
                //List<AnswerEntity> newList =  value.map((e) => AnswerEntity.fromJson(e)).toList();

                return Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: Column(
                      children: [
                          Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(onPressed: () async{
                    DateTime? newDateStart = await showDatePicker(
                      context: context,
                      initialDate: dateStart, 
                      firstDate: DateTime(2000), 
                      lastDate: DateTime(2100)
                      );
                      if(newDateStart == null) return;
                      dateStart = newDateStart;
                      print(dateStart);
                  }, child : Text("Date de début")),

                  TextButton(onPressed: () async{
                    DateTime? newDateEnd = await showDatePicker(
                     // locale : const Locale("fr", "FR"),
                      context: context,
                      initialDate: dateStart, 
                      firstDate: DateTime(2000), 
                      lastDate: DateTime(2100)
                      );
                      if(newDateEnd == null) return;
                      dateStart = newDateEnd;
                      print(dateEnd);
                  }, child : Text("Date de fin"))
              ],
            ),

            TextButton(onPressed: () async{
              List<AnswerEntity> value = await AnswerService().getByDate(dateStart, dateEnd);
              print(value.length);
            }, child: Text("Je récupère"))


                      ],
                    )
                  ),
                );

            }
      });
  }
}