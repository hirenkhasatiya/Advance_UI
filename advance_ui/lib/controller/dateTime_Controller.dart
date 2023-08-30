import 'package:flutter/material.dart';

class dateTimecontroller extends ChangeNotifier {
  DateTime? DT = DateTime.now();

  dateTimeChange({required DateTime dateTime}) {
    DT = dateTime;
    notifyListeners();
  }
}
