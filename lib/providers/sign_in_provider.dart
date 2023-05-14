import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier{
  int numOfClicksOnForgetPass = 0;
  bool isForgetPassClicked = false;

  incNumOfClicksOnForgetPass(){
    numOfClicksOnForgetPass++;
    notifyListeners();
  }

  setIsForgetPassClicked(){
    isForgetPassClicked = !isForgetPassClicked;
    notifyListeners();
  }
}