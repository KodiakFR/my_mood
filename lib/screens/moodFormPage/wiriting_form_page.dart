import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WritingFormPage extends StatelessWidget {
  const WritingFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(), 
      body: Center(child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Text("Ecris quelques lignes sur ton humeur d'aujourd'hui"),
        ),
        TextFormField(
          decoration:  const InputDecoration(
            
            border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
          ),
        )
      ],),),
    );
  }
}