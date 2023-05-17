import 'package:flutter/cupertino.dart';

class SignInScreenProvider extends ChangeNotifier{
  int numOfClicksOnForgetPass = 0;
  bool isForgetPassClicked = false;
  bool showPass = false;

  String phoneErrorMessage = '';
  String passErrorMessage = '';

  setPhoneErrorMessage(String str){
    phoneErrorMessage = str;
    notifyListeners();
  }

  setPassErrorMessage(String str){
    passErrorMessage = str;
    notifyListeners();
  }

  void setShowPass(){
    showPass = !showPass;
    notifyListeners();
  }

  incNumOfClicksOnForgetPass(){
    numOfClicksOnForgetPass++;
    notifyListeners();
  }

  setIsForgetPassClicked(){
    isForgetPassClicked = !isForgetPassClicked;
    notifyListeners();
  }
}