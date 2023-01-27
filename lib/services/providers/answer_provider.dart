import 'package:flutter/cupertino.dart';
import 'package:my_mood/models/answer_entity.dart';

class AnswerProvider with ChangeNotifier {

final AnswerEntity _answerEntityProvider = AnswerEntity();
AnswerEntity get myAnswerEntityProvider => _answerEntityProvider;


// Adding section
void addWeatherMood(String value) {
  _answerEntityProvider.weather = value;
  notifyListeners();

  print("ajout du string :" + _answerEntityProvider.weather.toString());
}

void addMoodTypeChoosen(String value) {
  if(_answerEntityProvider.moodTypeChoose == null || _answerEntityProvider.moodTypeChoose!.isEmpty) {
    _answerEntityProvider.moodTypeChoose = [];
    print("dedans");
  }

  _answerEntityProvider.moodTypeChoose?.add(value);
  notifyListeners();

  print("adding mood : " + value);
  print(_answerEntityProvider.moodTypeChoose.toString());
}


void addWritingMood(String value) {
  _answerEntityProvider.writingMood = value;
  notifyListeners();

  print("ajout du string :" + _answerEntityProvider.writingMood.toString());
}
/////////////////////////////


// Deleting section
void deleteMoodTypeChoosen(String value) {
  _answerEntityProvider.moodTypeChoose?.remove(value);
  notifyListeners();
  print("removing mood" + value);
  print(_answerEntityProvider.moodTypeChoose.toString());
}
///////////////////////



}