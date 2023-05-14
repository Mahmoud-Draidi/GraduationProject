import 'package:flutter/cupertino.dart';

class InputBoxProvider extends ChangeNotifier{
  bool showPass = false;

  void setShowPass(){
    showPass = !showPass;
    notifyListeners();
  }
}