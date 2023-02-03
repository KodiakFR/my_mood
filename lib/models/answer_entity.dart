class AnswerEntity {
  String? weather;
  List<dynamic>? moodTypeChoose;
  String? writingMood;
  DateTime? dateTime;


  AnswerEntity({ this.writingMood, this.weather, this.moodTypeChoose, this.dateTime});

  AnswerEntity.fromJson(Map<String?, dynamic> json)  : 
    weather = json["weather"],
    writingMood = json["writingMood"],
    moodTypeChoose = json["moodTypeChoose"],
    dateTime = json["dateTime"].toDate();

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["weather"] = weather;
    data["writingMood"] = writingMood;
    data["moodTypeChoose"] = moodTypeChoose;
    data["dateTime"] = dateTime;
    return data;
  }

     toJsonBis() => {
    "weather" : weather,
    "writingMood" : writingMood,
    "moodTypeChoose" : moodTypeChoose,
    "dateTime" : dateTime,
  };



}