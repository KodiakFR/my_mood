import '../../models/answer_entity.dart';
import '../../models/data_stats.dart';

class DataStatsRules {
  List<String> moodTypes = ["Travail", "Amour", "Nouvelle", "Voyage", "autres"];
  List<String> weather = ["Good mood", "Average mood", "Sad mood"];
  List<DataStats> valueMoodType = [];

  // Method permit to create a list of Datastats entites of each moodtype
  creationDataMoodType() {
    moodTypes.forEach((element) {
      valueMoodType.add(DataStats(moodType: element, totalMoodType: 0));
    });
  }

  //Metho permit to create a list of DataStats entites of each moodWeather
  creationDataWeatherMood() {
    weather.forEach((element) {valueMoodType.add(DataStats(moodWeather: element, totalWeather: 0));});
  }

  //Data to create the first pie : weather by total
  pieChartByWeatherMood(List<AnswerEntity> ListToTransfers) {
  creationDataWeatherMood();
    for (var item in ListToTransfers) {
      for (var itemStats in valueMoodType) {
        if (item.weather!.toLowerCase() ==
            itemStats.moodWeather!.toLowerCase()) {
          itemStats.totalWeather = itemStats.totalWeather! + 1;
        }
      }
    }
    return valueMoodType;
  }

  // Creation the second graph : Moodtype by total
  graphChartByMoodType(List<AnswerEntity> toTransfer) {
    creationDataMoodType();
    for (var item in toTransfer) {
      for (var itemStats in valueMoodType) {
        if (item.moodTypeChoose!.contains(itemStats.moodType)) {
          itemStats.totalMoodType = itemStats.totalMoodType! + 1;
        }
      }
    }
    return valueMoodType;
  }

}
