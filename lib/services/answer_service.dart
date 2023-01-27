import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_mood/models/answer_entity.dart';

class AnswerService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future addAnswerFromUser(AnswerEntity answerEntity) async {
        DocumentSnapshot<Map<String, dynamic>> result = 
              await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).get();       
    answerEntity.dateTime = DateTime.now();
    try {
        if(result.data()?["date"] == null) {
                await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).set({
          'weatherMood' : FieldValue.arrayUnion([answerEntity.weather.toString()]),
          'moodType' :  FieldValue.arrayUnion([answerEntity.moodTypeChoose.toString()]),
          'writingMood' : FieldValue.arrayUnion([answerEntity.writingMood.toString()]),
          'date' : FieldValue.arrayUnion([answerEntity.dateTime.toString()])
        });
        } else {
          print("dans le else");
                    await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).update({
          'weatherMood' : FieldValue.arrayUnion([answerEntity.weather.toString()]),
          'moodType' :  FieldValue.arrayUnion([answerEntity.moodTypeChoose.toString()]),
          'writingMood' : FieldValue.arrayUnion([answerEntity.writingMood.toString()]),
          'date' : FieldValue.arrayUnion([answerEntity.dateTime.toString()])
        });
        }
    
    } catch(e) {
      print(e.toString());
    }

  }




}