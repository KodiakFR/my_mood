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
                  body: Center(
                    child: Column(
                      children: [
                        
                      ],
                    )
                  ),
                );

            }
      });
  }
}