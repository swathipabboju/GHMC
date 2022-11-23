import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetChangeNotifier with ChangeNotifier {
  onclick(setLoadingState) async {
    if (setLoadingState == false) {
      setLoadingState = true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 3));
      setLoadingState = false;
      notifyListeners();
    }
  }
}
