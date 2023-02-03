import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_mood/models/answer_entity.dart';
import 'package:my_mood/services/answer_service.dart';
import 'package:my_mood/services/providers/result_by_date_provider.dart';
import 'package:provider/provider.dart';

class SummarizeAnswers extends StatefulWidget {
  SummarizeAnswers({Key? key}) : super(key: key);
  

  @override
  State<SummarizeAnswers> createState() => _SummarizeAnswersState();
}
  
  DateTime dateStart = DateTime.now();
  DateTime dateEnd = DateTime.now();
  List<AnswerEntity> values = [];


class _SummarizeAnswersState extends State<SummarizeAnswers> {
  @override
  Widget build(BuildContext context) {
    context.watch<ResultByDateProvider>().myanswers;
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
                      dateStart = DateTime(newDateStart.year,newDateStart.month,newDateStart.day, DateTime.now().hour, DateTime.now().minute);                  
                      //dateStart = newDateStart;
                      print(dateStart);
                  }, child : Text("Date de début")),

                  TextButton(onPressed: () async{
                    DateTime? newDateEnd = await showDatePicker(
                     // locale : const Locale("fr", "FR"),
                      context: context,
                      initialDate: dateEnd, 
                      firstDate: DateTime(2000), 
                      lastDate: DateTime(2100)
                      );
                      if(newDateEnd == null) return;
                      dateEnd = DateTime(newDateEnd.year,newDateEnd.month,newDateEnd.day, DateTime.now().hour, DateTime.now().minute);
                      //dateEnd = newDateEnd;
                      print(dateEnd);
                  }, child : Text("Date de fin"))
              ],
            ),

            TextButton(onPressed: () async{
              if(dateStart == dateEnd) {
                showDialog(context: context, builder: (context) => 
                  AlertDialog(
                    title : Text("You can't choose two identicals date.",  textAlign: TextAlign.center),
                    actions: <Widget>[
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child : Text("Ok"),)
                  ],
                  )
                );
              }
             values = await AnswerService().getByDate(dateStart, dateEnd);
             context.read<ResultByDateProvider>().addAnswers(values);             
            }, child: Text("Je récupère")),


            if(values.isNotEmpty)...[
              Container(
                child:  ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: values.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading : Text(values[index].weather.toString()),
                  subtitle: Text(values[index].moodTypeChoose.toString()),
                );
              })
              )
              
             
            ]    


                      ],
                    )
                  ),
                );

            }
      });
  }
}