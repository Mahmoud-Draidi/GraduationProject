import 'package:flutter/cupertino.dart';

class SignInScreenProvider extends ChangeNotifier{
  int numOfClicksOnForgetPass = 0;
  bool isForgetPassClicked = false;
  bool showPass = false;
  bool showDialog = false;

  String phoneErrorMessage = '';
  String passErrorMessage = '';

  String failedMessage = '';


  setShowDialogTrue(){
    showDialog = true;
    notifyListeners();
  }
  setShowDialogFalse(){
    showDialog = false;
    notifyListeners();
  }
  setFailedMessage(String str){
    failedMessage = str;
    notifyListeners();
  }
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