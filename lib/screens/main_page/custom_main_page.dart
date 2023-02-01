import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomMainPage {


  cardCustom(String title, Icon icon, String route, BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: Center(
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    alignment: Alignment.center,
                    child : 
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/$route');
                      },
                      leading: icon,
                      title : Text(title),
                      ),
                      ),
                ),
              ),
            );
  }
}