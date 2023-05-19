import 'package:flutter/cupertino.dart';

class SendCodeProvider extends ChangeNotifier{
  int numOfClicksOnResendCode = 0;
  bool isInDuration = false;
  String codeErrorMessage = '';




  setCodeErrorMessage(String str){
    codeErrorMessage = str;
  }
  incNumOfClicksOnResendCode(){
    numOfClicksOnResendCode++;
    notifyListeners();
  }

  setIsInDuration(){
    isInDuration = !isInDuration;
    notifyListeners();
  }
}