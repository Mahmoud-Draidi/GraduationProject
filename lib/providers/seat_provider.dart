import 'package:flutter/cupertino.dart';
import 'package:mowasulatuna/models/Seat.dart';

class SeatProvider extends ChangeNotifier{
  int typeOfSeat = 1;
  String name = ' ';
  String location ='';

  List<Seat> seats=[];


  setLocation(String str){
    location =str;
  }
  setName(String str){
    name = str;
    notifyListeners();
  }

  setTypeOfSeat(int n){
    typeOfSeat  = n;
    notifyListeners();
  }
}