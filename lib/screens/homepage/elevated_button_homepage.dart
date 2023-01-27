import 'package:flutter/material.dart';
import 'package:my_mood/models/answer_entity.dart';
import 'package:my_mood/services/providers/answer_provider.dart';
import 'package:provider/provider.dart';

class ElevatedButtonHomePage extends StatelessWidget {
  final String urlImage;
  final String weatherF;
  AnswerEntity answerEntity = AnswerEntity();
  ElevatedButtonHomePage({
    required this.urlImage, required this.weatherF,
    super.key});

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return  ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.black.withOpacity(0))
              ,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/MoodForm');
                //answerEntity.weather = weatherF;
                
                context.read<AnswerProvider>().addWeatherMood(weatherF);
              },
              child: Image.asset(
                urlImage,
                height: sizeHeight/7,
                //width: 150,
              ),
            );
  }
}