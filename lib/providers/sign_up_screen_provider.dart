import 'package:flutter/cupertino.dart';

class SignUpScreenProvider extends ChangeNotifier{
  String nameErrorMessage = '';
  String phoneErrorMessage = '';
  String emailErrorMessage = '';
  String passErrorMessage = '';
  String repeatePassErrorMessage = '';
  bool showDialog = false;
  bool isPhoneExist = false;

  setIsPhoneExistTrue(){
    isPhoneExist = true;
    notifyListeners();
  }

  setShowDialogTrue(){
    showDialog = true;
    notifyListeners();
  }
  setShowDialogFalse(){
    showDialog = false;
    notifyListeners();
  }

  setNameErrorMessage(String str){
    nameErrorMessage = str;
    notifyListeners();
  }
  setPhoneErrorMessage(String str){
    phoneErrorMessage = str;
    notifyListeners();
  }
  setEmailErrorMessage(String str){
    emailErrorMessage = str;
    notifyListeners();
  }
  setPassErrorMessage(String str){
    passErrorMessage = str;
    notifyListeners();
  }
  setRepeatPassErrorMessage(String str){
    repeatePassErrorMessage = str;
    notifyListeners();
  }
}