import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_mood/models/answer_entity.dart';

class AnswerService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //CREATE
  Future addAnswerFromUser(AnswerEntity answerEntity) async {
        DocumentSnapshot<Map<String, dynamic>> result = 
              await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).get();       
    answerEntity.dateTime = DateTime.now();
    try {
      if(result.data()?["answers"] == null) {
                await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).set({"answers" : 
                FieldValue.arrayUnion(
                  [answerEntity.toJson()])
        });
        } else {
          print("dedans ??????");
                    await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).update({ "answers" : 
                    FieldValue.arrayUnion([answerEntity.toJson()]
        )});
        }
    
    } catch(e) {
      print(e.toString());
    }

  }


    //READ
    Future<List<AnswerEntity>> get getSummarizeAnswer async{
      DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).get();
      List<dynamic> listD = result.data()?["answers"];
      List<AnswerEntity> newList = listD.map((e) => AnswerEntity.fromJson(e)).toList();
      return newList;
      //return result.data()?["answers"];
      
  
    }

    






}