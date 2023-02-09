import '../../models/answer_entity.dart';
import '../../models/data_stats.dart';

class DataStatsRules {
  List<String> moodTypes = ["Travail", "Amour", "Nouvelle", "Voyage", "autres"];
  List<String> weather = ["Good mood", "Average mood", "Sad mood"];
  List<DataStats> valueMoodType = [];

  creationData() {
    moodTypes.forEach((element) {
      valueMoodType.add(DataStats(moodType: element, totalMoodType: 0));
    });
  }
    creationDataWeatherMoodType() {
    for (var item in moodTypes) {
      for (var ite in weather) {
        valueMoodType.add(DataStats(weatherByMoodType: ite + " by " + item, totalMoodType: 0));        
      }
    }
  }

  PieChartByWeatherMood(List<AnswerEntity> ListToTransfers) {
      List<DataStats> valuesWeatherMood = [
    DataStats(moodWeather: "Good mood", totalWeather: 0),
    DataStats(moodWeather: "Average mood", totalWeather: 0),
    DataStats(moodWeather: "Sad mood", totalWeather: 0),
  ];
    for (var item in ListToTransfers) {
      for (var itemStats in valuesWeatherMood) {
        if (item.weather!.toLowerCase() ==
            itemStats.moodWeather!.toLowerCase()) {
          itemStats.totalWeather = itemStats.totalWeather! + 1;
        }
      }
    }
    return valuesWeatherMood;
  }

  graphChartByMoodType(List<AnswerEntity> toTransfer) {
    creationData();
    for (var item in toTransfer) {
      for (var itemStats in valueMoodType) {
        if (item.moodTypeChoose!.contains(itemStats.moodType)) {
          itemStats.totalMoodType = itemStats.totalMoodType! + 1;
        }
      }
    }
    return valueMoodType;
  }


  // graphByWeatherAndMoodtype(List<AnswerEntity> toTransfer) {
  //   creationDataWeatherMoodType();
  //   for (var item in toTransfer) {
  //     for (var itemStats in valueMoodType) {
  //       for (var element in item.moodTypeChoose!) {
  //         if(itemStats.weatherByMoodType!.contains(element) & itemStats.weatherByMoodType!.contains("${item.weather}")) {
  //           itemStats.totalMoodType = itemStats.totalMoodType! +1;
  //       }
  //       }  
  //     }
      
  //   }
  //   valueMoodType.removeWhere((element) => element.totalMoodType ==0);
  //   return valueMoodType;
  // }




}
