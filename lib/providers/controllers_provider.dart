import 'package:flutter/cupertino.dart';

class ControllerProvider extends ChangeNotifier{
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerRepeatPass = TextEditingController();


  setName(String s){
    controllerName.text = s;
    notifyListeners();
  }
  setEmail(String s){
    controllerEmail.text = s;
  }
  setPass(String s){
    controllerPass.text = s;
  }
  setRepeatPass(String s){
    controllerRepeatPass.text = s;
  }
}