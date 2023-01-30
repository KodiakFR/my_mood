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
      if(result.data()?["answer"] == null) {
                await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).set({"answers" : 
                FieldValue.arrayUnion(
                  [answerEntity.toJson()])
        });
        } else {
                    await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).update({ "answers" : 
                    FieldValue.arrayUnion([answerEntity.toJson()]
        )});
        }
    
    } catch(e) {
      print(e.toString());
    }

  }




}