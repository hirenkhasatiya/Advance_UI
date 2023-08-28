import 'dart:io';

import 'package:flutter/material.dart';

class platformcontroller extends ChangeNotifier {
  bool isandroid = Platform.isAndroid;

  changePlatform() {
    isandroid = !isandroid;

    notifyListeners();
  }
}
