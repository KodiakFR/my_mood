import 'package:flutter/material.dart';

class DateEndProvider with ChangeNotifier {

DateTime? _dateEnd;
DateTime? get myDateEnd => _dateEnd;


//Adding the date
void addDateEnd(DateTime value) {
    _dateEnd = value;
  notifyListeners();
  print("ajout de la date fin");
}

}