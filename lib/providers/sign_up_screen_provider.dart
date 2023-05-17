import 'package:flutter/cupertino.dart';

class SignUpScreenProvider extends ChangeNotifier{
  String nameErrorMessage = '';
  String phoneErrorMessage = '';
  String emailErrorMessage = '';
  String passErrorMessage = '';
  String repeatePassErrorMessage = '';

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