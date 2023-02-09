import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_mood/models/answer_entity.dart';
import 'package:my_mood/models/data_stats.dart';
import 'package:my_mood/services/answer_service.dart';
import 'package:my_mood/services/providers/result_by_date_provider.dart';
import 'package:my_mood/services/rules/data_stats_rules.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummarizeAnswers extends StatefulWidget {
  SummarizeAnswers({Key? key}) : super(key: key);

  @override
  State<SummarizeAnswers> createState() => _SummarizeAnswersState();
}

DateTime? newDateStart;
DateTime dateStart = DateTime.now();
DateTime dateEnd = DateTime.now();
List<AnswerEntity> values = [];
List<DataStats> valuesStats = [];
List<DataStats> secondeValuesStats = [];
List<DataStats> thirdValue = [];

class _SummarizeAnswersState extends State<SummarizeAnswers> {
  @override
  Widget build(BuildContext context) {
    context.watch<ResultByDateProvider>().myanswers;
    return FutureBuilder(
        future: AnswerService().getSummarizeAnswer,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Erreur lors de la récuparation data 1');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            var value = snapshot.data!;
            return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.symmetric(horizontal: BorderSide()),
                        color: Colors.grey[200]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () async {
                            newDateStart = await showDatePicker(
                                context: context,
                                initialDate: dateStart,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (newDateStart == null) return;
                            dateStart = DateTime(
                                newDateStart!.year,
                                newDateStart!.month,
                                newDateStart!.day,
                                DateTime.now().hour,
                                DateTime.now().minute);
                            //dateStart = newDateStart;
                            print(dateStart);
                          },
                          child: Text("Date de début",
                              style: TextStyle(color: Colors.black)),
                        ),
                        Text(" - "),
                        TextButton(
                            onPressed: () async {
                              DateTime? newDateEnd = await showDatePicker(
                                  // locale : const Locale("fr", "FR"),
                                  context: context,
                                  initialDate: dateEnd,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100));
                              if (newDateEnd == null) return;
                              dateEnd = DateTime(
                                  newDateEnd.year,
                                  newDateEnd.month,
                                  newDateEnd.day,
                                  DateTime.now().hour,
                                  DateTime.now().minute);
                              //dateEnd = newDateEnd;
                              print(dateEnd);
                            },
                            child: Text("Date de fin",
                                style: TextStyle(color: Colors.black))),
                        SizedBox(width : 80),
                        TextButton(
                            onPressed: () async {
                              if (dateStart == dateEnd) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(
                                              "You can't choose two identicals date.",
                                              textAlign: TextAlign.center),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Ok"),
                                            )
                                          ],
                                        ));
                              }
                              values = await AnswerService()
                                  .getByDate(dateStart, dateEnd);
                              context
                                  .read<ResultByDateProvider>()
                                  .addAnswers(values);

                              // Input differents rules to use graph :
                              valuesStats = DataStatsRules()
                                  .PieChartByWeatherMood(values);
                              secondeValuesStats =
                                  DataStatsRules().graphChartByMoodType(values);
                            },
                            child: Icon(Icons.search, color: Colors.black,))
                      ]
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (values.isNotEmpty) ...[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          SfCircularChart(
                            title: ChartTitle(
                                text: "Mood weather from your time choosen"),
                            legend: Legend(isVisible: true),
                            series: <CircularSeries>[
                              DoughnutSeries<DataStats, String>(
                                dataSource: valuesStats,
                                xValueMapper: (DataStats ds, _) =>
                                    ds.moodWeather,
                                yValueMapper: (DataStats ds, _) =>
                                    ds.totalWeather,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          if (valuesStats
                                  .reduce((a, b) =>
                                      a.totalWeather! > b.totalWeather! ? a : b)
                                  .moodWeather ==
                              "Good mood")
                            Text("Text description for good mood"),
                          if (valuesStats
                                  .reduce((a, b) =>
                                      a.totalWeather! > b.totalWeather! ? a : b)
                                  .moodWeather ==
                              "Average mood")
                            Text("Text description for average mood"),
                          if (valuesStats
                                  .reduce((a, b) =>
                                      a.totalWeather! > b.totalWeather! ? a : b)
                                  .moodWeather ==
                              "Sad mood")
                            Text("Text description for sad mood"),
                        ],
                      ),
                    ),

                    //  SizedBox(height: 10,child: Container(decoration: BoxDecoration(border: Border(bottom: BorderSide()),))),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                                minimum: 0,
                                maximum: secondeValuesStats
                                    .reduce((a, b) =>
                                        a.totalMoodType! > b.totalMoodType!
                                            ? a
                                            : b)
                                    .totalMoodType!
                                    .toDouble(),
                                interval: 5),
                            title:
                                ChartTitle(text: "Number of moodtype selected"),
                            //legend: Legend(isVisible: true),
                            series: <ChartSeries>[
                              ColumnSeries<DataStats, String>(
                                dataSource: secondeValuesStats,
                                xValueMapper: (DataStats ds, _) => ds.moodType,
                                yValueMapper: (DataStats ds, _) =>
                                    ds.totalMoodType,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              )),
            );
          }
        });
  }
}
