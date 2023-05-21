import 'package:flutter/cupertino.dart';

class UserTypeProvider extends ChangeNotifier{
  bool isDriver = false;

  setIsDriverTrue(){
    isDriver = true;
    notifyListeners();
  }

  setDriverFalse(){
    isDriver =  false;
    notifyListeners();
  }

}