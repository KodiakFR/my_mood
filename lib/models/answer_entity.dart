class AnswerEntity {
  String? weather;
  List<String> moodTypes = ["Travail", "Amour", "Nouvelle", "Voyage", "autres"];
  List<bool> boolAnswers = [false, false, false, false, false];
  List<String>? moodTypeChoose;
  String? writingMood;

  AnswerEntity({moodTypes,  boolAnswers ,this.writingMood, this.weather, this.moodTypeChoose});

}