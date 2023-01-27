import 'package:flutter/material.dart';

class AppBarCustom {
 backgroundOfAppbar(String title) {
    return   AppBar(
       title: Text(title),
       centerTitle: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              begin : Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.indigo,
                Colors.deepPurpleAccent
              ]
            )
          ),    
        ), 
        elevation: 0,
    );
  }
}