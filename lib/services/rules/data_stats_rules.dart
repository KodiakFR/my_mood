import '../../models/answer_entity.dart';
import '../../models/data_stats.dart';

class DataStatsRules {
  List<DataStats> valuesWeatherMood = [
    DataStats(moodWeather: "Good mood", totalWeather: 0),
    DataStats(moodWeather: "average mood", totalWeather: 0),
    DataStats(moodWeather: "sad mood", totalWeather: 0),
  ];
  List<String> moodTypes = ["Travail", "Amour", "Nouvelle", "Voyage", "autres"];
  List<DataStats> valueMoodType = [];

  creationData() {
    moodTypes.forEach((element) {
      valueMoodType.add(DataStats(moodType: element, totalMoodType: 0));
    });
  }

  PieChartByWeatherMood(List<AnswerEntity> ListToTransfers) {
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
}
