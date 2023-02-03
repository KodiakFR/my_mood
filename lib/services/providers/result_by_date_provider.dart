import 'package:flutter/cupertino.dart';
import 'package:my_mood/models/answer_entity.dart';

class ResultByDateProvider with ChangeNotifier {

  final List<AnswerEntity> _answers =  [];
  List<AnswerEntity> get myanswers => _answers;


  // add section
  void addAnswers(List<AnswerEntity> values) {
    _answers.addAll(values);
    notifyListeners();

    print("ajout du tableau d'entities : " + _answers.toString());
  }



}