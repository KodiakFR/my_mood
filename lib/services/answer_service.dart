import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:my_mood/models/answer_entity.dart';

class AnswerService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //CREATE
  Future addAnswerFromUser(AnswerEntity answerEntity) async{
    answerEntity.dateTime =  DateTime.now();
    var result = await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).collection('answers').count().get();
    await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).collection('answers')
      .doc('${result.count}').set(
        answerEntity.toJsonBis() 
      );
  }


    //READ
    Future<List<AnswerEntity>> get getSummarizeAnswer async{
      // DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).get();
      // List<dynamic> listD = result.data()?["answers"];
      // List<AnswerEntity> newList = listD.map((e) => AnswerEntity.fromJson(e)).toList();
      // return newList; 
      return [];
      //return result.data()?["answers"]
    }


    Future<List<AnswerEntity>> getByDate(DateTime dateStart, DateTime dateEnd) async{
      List<AnswerEntity> newAnswers = [];
      var selectAnswer = await FirebaseFirestore.instance.collection('users').doc('${_auth.currentUser!.uid}').collection('answers')
      .where('dateTime', isGreaterThanOrEqualTo: dateStart, isLessThanOrEqualTo: dateEnd)
      .get();
      print("je regarde la taille de ma requête : ${selectAnswer.docs.length}");
      
      newAnswers = selectAnswer.docs.map((e) => AnswerEntity.fromJson(e.data() as Map<String, dynamic>)).toList();
      print("la taille de l'answer est : ${newAnswers.length}");
      return newAnswers;
    }

        




}