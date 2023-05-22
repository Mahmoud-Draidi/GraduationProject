import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingProcessProvider extends ChangeNotifier {
  // List<String> usersIDsList = [];
  // addToUserIDsList(String s){
  //   usersIDsList.add(s);
  //   notifyListeners();
  // }
  // deleteFromUserIDsList(){
  //   usersIDsList.removeLast();
  //   notifyListeners();
  // }

  void setSeatState(String name, int newState) {
    for (Map<String, dynamic> seat in seats) {
      if (seat['name'] == name) {
        seat['state'] = newState;
        break; // Assuming there is only one map with the given name, you can exit the loop once found.
      }
    }
    notifyListeners();
  }

  setIthSeat(int i, Map<String, dynamic> mp) {
    seats[i] = mp;
    notifyListeners();
  }

  putBookedPersonsToSeats(int n) {
    for (int i = 0; i < n; i++) {
      seats[i]['state'] = 2;
      seats[i]['name'] = documentsOfBooks2![i]['name'];
      seats[i]['location'] = documentsOfBooks2![i]['location'];
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> seats = [
    {'state':0,'name':'a a a a','location': 'a location'},
    {'state':0,'name':'b b b b','location': 'a location'},
    {'state':0,'name':'c c c c','location': 'a location'},
    {'state':0,'name':'a a a a','location': 'a location'},
    {'state':0,'name':'a a a a','location': 'a location'},
    {'state':0,'name':'a a a a','location': 'a location'},
    {'state':0,'name':'a a a a','location': 'a location'},
  ];

  setSeats(List<Map<String, dynamic>> l) {
    seats = l;
    notifyListeners();
  }

  sortSeats() {
    seats.sort((a, b) => a['state'].compareTo(b['state']));
    notifyListeners();
  }

  List<Map<String, dynamic>>? documentsOfBooks2 = [];

  setDocumentOfBooks2(List<Map<String, dynamic>> l) {
    documentsOfBooks2 = l;
    notifyListeners();
  }

  int bookState = 0;

  setBookStateZero() {
    bookState = 0;
  }

  setBookStateOne() {
    bookState = 1;
  }

  setBookStateTwo() {
    bookState = 2;
  }

  setBookStateThree() {
    bookState = 3;
  }

  bool isFutrue = false;
  TimeOfDay selectedTimeOfDay = TimeOfDay.now();

  setSelectedTomeOfDay(TimeOfDay t) {
    selectedTimeOfDay = t;
    notifyListeners();
  }

  setIsFutureTrue() {
    isFutrue = true;
    notifyListeners();
  }

  setIsFuturefalse() {
    isFutrue = false;
    notifyListeners();
  }
}
