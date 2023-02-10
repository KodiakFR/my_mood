import 'package:flutter/cupertino.dart';

class DateStartProvider with ChangeNotifier {

DateTime? _dateStart;
DateTime? get myDateStart => _dateStart;


//Adding the date
void addDateStart(DateTime value) {
    _dateStart = value;
  notifyListeners();

  print("ajout de la date");
}

}