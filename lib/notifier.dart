import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoadingState extends ChangeNotifier {
  bool isLoading = false;

  void startLoader() async{
    if (!isLoading) {
      isLoading = true;
      await Future.delayed(Duration(seconds: 3));
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
     
      notifyListeners();
    }
  }
}


/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetChangeNotifier with ChangeNotifier {
  bool _isLoading = false;

  onclick() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    _isLoading = false;
                           
    
  }
}
 */