import 'package:flutter/material.dart';

class AppBarCustom {
 backgroundOfAppbar(String title) {
    return   AppBar(
       title: Text(title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin : Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blueAccent,
                Colors.deepPurpleAccent
              ]
            )
          ),
        ),
    );
  }
}