import 'package:flutter/cupertino.dart';

class SendCodeProvider extends ChangeNotifier{
  int numOfClicksOnResendCode = 0;
  bool isInDuration = false;

  incNumOfClicksOnResendCode(){
    numOfClicksOnResendCode++;
    notifyListeners();
  }

  setIsInDuration(){
    isInDuration = !isInDuration;
    notifyListeners();
  }
}