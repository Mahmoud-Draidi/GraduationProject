import 'package:flutter/cupertino.dart';

class DriverProvider extends ChangeNotifier{

  Map<String, dynamic> currentDriverMap={};

  setCurrenDriverMap(Map<String, dynamic>mp){
    currentDriverMap = mp;
    notifyListeners();
  }

}