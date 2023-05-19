import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerProvider extends ChangeNotifier{
  int start = 30;
  Timer? timer;

  decStart(){
    start--;
    notifyListeners();
  }
  // setStart(int n){
  //   start = n;
  //   notifyListeners();
  // }
  cancelTimer(){
    timer?.cancel();
    notifyListeners();
  }

  setTimer(Timer t){
    timer = t;
    notifyListeners();
  }
}