import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookProviderPassenger extends ChangeNotifier{


  bool isOrangeCase = false;
  String locationValue='الدوار';
  String selectedTime = '12:00';
  String bookDay = 'اليوم';


  String detailsDayDate = '';
  String detailsLocation ='';
  String detailsBookTime = '';
  String detailsNumOfPersons = '';
  String detailsExpectedBusTime ='';
  String detailsDriverName = '';

  int canCancelBook = 0;

  setCanCancelBook(int n){
    canCancelBook = n;
    notifyListeners();
  }

  getDetailsDayDate(){
    DateTime now = DateTime.now();
    final DateTime nextDay = now.add(Duration(days: 1));
    final DateFormat formatter = DateFormat('EEEE');
    final String nextDayName = formatter.format(nextDay);
    if(bookDay=='اليوم'){
      return '${now.year}-${now.month}-${now.day}   ${changeToArabic(DateFormat('EEEE').format(now))}';
    }
    else{
      return '${now.day+1}-${now.month}-${now.year}   ${changeToArabic(nextDayName)}';
    }
  }
  getDetailsLocation(){
    return locationValue;
  }
  getDetailsBookTime(){
    return selectedTime;
  }
  getDetailsNumOfPersons(){
    return numOfPersons.toString();
  }
  getDetailsExpectedBusTime(){
    return '20:00';
  }
  getDetailsDriverName(){
    return 'غير معروف';
  }

  int numOfPersons = 1;

  setBookDay(String str){
    bookDay = str;
    notifyListeners();
  }
  setLocation(String str){
    locationValue =str;
    notifyListeners();
  }
  // setTimeDate(String str){
  //   // timeDate =str;
  //   notifyListeners();
  // }
  setNumOfPersons(int n){
    numOfPersons =n;
    notifyListeners();
  }

  // setIsBooked(){
  //   isBooked = !isBooked;
  //   notifyListeners();
  // }

  setIsOrangeCase(){
    isOrangeCase = !isOrangeCase;
    notifyListeners();
  }

  setSelectedTime(String t){
    selectedTime = t;
    notifyListeners();
  }

  changeToArabic(String str){
    if(str == 'Sunday')return 'الأحد';
    else if(str == 'Monday') return 'الإثنين';
    else if(str == 'TuesDay') return 'الثلاثاء';
    else if(str == 'Wednesday') return 'الأربعاء';
    else if(str == 'Thursday') return 'الخميس';
    else if(str == 'Friday') return 'الجمعة';
    else return 'السبت';
  }


  int index = 0;
  getIndex(){
    return index;
    notifyListeners();
  }
  setIndex(int n){
    index = n;
  }
}