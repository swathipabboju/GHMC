import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifier with ChangeNotifier {
  FocusNode myFocusNode = new FocusNode();

  onclick() {
    myFocusNode.hasFocus ? Colors.white : Colors.black;
    notifyListeners();
  }
  
}
