class AnswerEntity {
  List<String> moodTypes = ["Travail", "Amour", "Nouvelle", "Voyage", "autres"];
  List<bool> boolAnswers = [false, false, false, false, false];
  String? writingMood;

  AnswerEntity({moodTypes,  boolAnswers ,this.writingMood});

}