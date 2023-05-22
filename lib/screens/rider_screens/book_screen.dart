import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mowasulatuna/providers/booking_process_provider.dart';
import 'package:mowasulatuna/screens/rider_screens/book_details.dart';
import 'package:mowasulatuna/widgets/book_box.dart';
import 'package:provider/provider.dart';
import '../../providers/book_provider_passenger.dart';

class BookScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final pro = Provider.of<BookProviderPassenger>(context);
    final proBook = Provider.of<BookingProcessProvider>(context);

    List<String> choices = [
      'طولكرم(الكراج)',
      'الحارة الشرقية',
      'الصلعة',
      'الدوار',
      'العقبة',
      'الناموس'
    ];


    List<String> nums = ['1', '2', '3', '4', '5', '6','7'];

    // DateTime now = DateTime.now();
    // if(DateFormat('EEEE').format(now)=='Friday'){
    //   dayTomorrowList =['غداّّ'];
    // }
    // else if(DateFormat('EEEE').format(now)=='Thursday'){
    //   dayTomorrowList=['اليوم'];
    // }
    // else{
    //   dayTomorrowList = ['اليوم','غداََ'];
    // }


    bool isPast(TimeOfDay givenTime) {
      TimeOfDay currentTime = TimeOfDay.now();
      return givenTime.hour < currentTime.hour ||
          (givenTime.hour == currentTime.hour && givenTime.minute < currentTime.minute);
    }

    bool isFuture(TimeOfDay givenTime) {
      TimeOfDay currentTime = TimeOfDay.now();
      return givenTime.hour > currentTime.hour ||
          (givenTime.hour == currentTime.hour && givenTime.minute > currentTime.minute);
    }

    Future<String> selectTime(BuildContext context) async {
      final Completer<String> completer = Completer<String>();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16.0),
                  Text('Loading...'),
                ],
              ),
            ),
          );
        },
      );
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      Navigator.pop(context); // Close the loading dialog

      if (pickedTime != null) {
        final String formattedTime = pickedTime.format(context);
        completer.complete(formattedTime);
      } else {
        completer.complete('');
      }

      proBook.setSelectedTomeOfDay(pickedTime!);

      return completer.future;
    }

    Future<void> updateTime() async {
      final String time = await selectTime(context);
      pro.setSelectedTime(time);
    }




    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h,
      width: w,
      child: Scaffold(
        //AppBar
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.10), // here the desired height
          child: AppBar(
            flexibleSpace: Container(
              height: h * 0.13,
              width: w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1a2636).withOpacity(0.8),
                    Color(0xff434343).withOpacity(0.8),
                  ],
                ),
              ),
            ),
            title: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    print('csacsa');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: h * 0.015,
                    ),
                    height: h * 0.053,
                    width: w * 0.38,
                    child: Image.asset('assets/images/logoText.png'),
                  ),
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),

        //Body
        body: Container(
          height: h,
          width: w,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: h * 0.52,
                width: w * 0.93,
                decoration: BoxDecoration(
                    color: Color(0x3f757575).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: [
                    Positioned(
                      top: h * 0.015,
                      right: w * 0.015,
                      child: Container(
                        height: h * 0.46,
                        width: w * 0.85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image:
                              AssetImage('assets/images/bookManuallyForm.png'),
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),

                    //Location
                    Positioned(
                      top: h * 0.068,
                      right: w * 0.11,
                      child: Container(
                        height: h * 0.05,
                        width: w * 0.65,
                        padding: EdgeInsets.only(left: w * 0.29),
                        decoration: BoxDecoration(
                          color: Color(0xFF353535),
                        ),
                        child: Container(
                          width: w * 0.5,
                          child: PopupMenuButton<String>(
                            color: Color(0xFF353535),
                            offset: Offset(0, 35),
                            // Adjust the vertical offset as needed
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF353535),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      pro.locationValue ?? '',
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.vazirmatn(
                                        color: const Color(0xfff0f0f0),
                                        textStyle: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 32,
                                    color: Color(0xffdda006),
                                  ),
                                ],
                              ),
                            ),
                            itemBuilder: (BuildContext context) =>
                                choices.map((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.vazirmatn(
                                      color: Color(0xfff0f0f0),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onSelected: (String val) {
                              pro.setLocation(val);
                            },
                          ),
                        ),
                      ),
                    ),

                    // day and time
                    Positioned(
                      top: h * 0.205,
                      right: w * 0.11,
                      child: Container(
                        height: h * 0.05,
                        width: w * 0.65,
                        decoration: BoxDecoration(
                          color: Color(0xFF353535),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // GestureDetector(
                            //   child: Container(
                            //     width: w * 0.25,
                            //     child: PopupMenuButton<String>(
                            //       color: Color(0xFF353535),
                            //       offset: Offset(0, 28),
                            //       // Adjust the vertical offset as needed
                            //       child: Container(
                            //         height: 28,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(15),
                            //           color: Color(0xFF353535),
                            //         ),
                            //         child: Row(
                            //           mainAxisAlignment: MainAxisAlignment.end,
                            //           children: [
                            //             Padding(
                            //               padding: const EdgeInsets.only(left: 8,top:5),
                            //               child: Text(
                            //                 pro.bookDay ?? '',
                            //                 textAlign: TextAlign.right,
                            //                 style: GoogleFonts.vazirmatn(
                            //                   color: const Color(0xfff0f0f0),
                            //                   textStyle: const TextStyle(
                            //                     fontSize: 18,
                            //                     fontWeight: FontWeight.w500,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Icon(
                            //               Icons.arrow_drop_down,
                            //               size: 32,
                            //               color: Color(0xffdda006),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       itemBuilder: (BuildContext context) =>
                            //           dayTomorrowList.map((String value) {
                            //             return PopupMenuItem<String>(
                            //               value: value,
                            //               child: Align(
                            //                 alignment: Alignment.centerRight,
                            //                 child: Text(
                            //                   value,
                            //                   textAlign: TextAlign.right,
                            //                   style: GoogleFonts.vazirmatn(
                            //                     color: Color(0xfff0f0f0),
                            //                     textStyle: TextStyle(
                            //                       fontSize: 18,
                            //                       fontWeight: FontWeight.w700,
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           }).toList(),
                            //       onSelected: (String? val) {
                            //         pro.setBookDay(val!);
                            //       },
                            //     ),
                            //   ),
                            // ),

                            GestureDetector(
                              onTap: (){
                                updateTime();
                              },
                              child: Container(
                                width: w * 0.33,
                                height: 28,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,top:5),
                                      child: Text(
                                        pro.selectedTime,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.vazirmatn(
                                          color: const Color(0xfff0f0f0),
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 32,
                                      color: Color(0xffdda006),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // num of persons
                    Positioned(
                      top: h * 0.338,
                      right: w * 0.11,
                      child: Container(
                        height: h * 0.05,
                        width: w * 0.65,
                        padding: EdgeInsets.only(left: w * 0.29),
                        decoration: BoxDecoration(
                          color: Color(0xFF353535),
                        ),
                        child: Container(
                          width: w * 0.5,
                          child: PopupMenuButton<String>(
                            color: Color(0xFF353535),
                            offset: Offset(0, 28),
                            // Adjust the vertical offset as needed
                            child: Container(
                              height: 28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF353535),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8,top:5),
                                    child: Text(
                                      pro.numOfPersons.toString() ?? '',
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.vazirmatn(
                                        color: const Color(0xfff0f0f0),
                                        textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 32,
                                    color: Color(0xffdda006),
                                  ),
                                ],
                              ),
                            ),
                            itemBuilder: (BuildContext context) =>
                                nums.map((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.vazirmatn(

                                      color: Color(0xfff0f0f0),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onSelected: (String? val) {
                              pro.setNumOfPersons(int.parse(val!));
                            },
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: h * 0.44,
                      right: w * 0.245,
                      child: GestureDetector(
                        onTap: () async{
                          print(pro.locationValue);
                          print(pro.selectedTime);
                          print(pro.bookDay);
                          print(pro.numOfPersons);


                          DateTime now = DateTime.now();
                          if(proBook.bookState==2||proBook.bookState==3){
                            AwesomeDialog(
                              context: context,
                              title: "Error",
                              body: Text('لايمكنك الحجز، انت حاجز بالفعل'),
                            ).show();
                          }
                          else if(proBook.bookState==1){
                            AwesomeDialog(
                              context: context,
                              title: "Error",
                              body: Text('فم بالغاء الحجز السابق اولا'),
                            ).show();
                          }
                          else if(DateFormat('EEEE').format(now)=='Friday'){
                            AwesomeDialog(
                              context: context,
                              title: "Error",
                              body: Text('لا يوجد مواصلات يوم الجمعة'),
                            ).show();
                          }
                          else if(isPast(proBook.selectedTimeOfDay!)){
                            AwesomeDialog(
                              context: context,
                              title: "Error",
                              body: Text('اختر وقتا صحيحا'),
                            ).show();
                          }
                          else {
                            pro.setCanCancelBook(0);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookDetails(),
                              ),
                            );
                          }


                        },
                        child: Container(
                          height: h * 0.055,
                          width: w * 0.4,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "احجز مقعدك",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.vazirmatn(
                                  color: Color(0xb2f0f0f0),
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/Vector.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Color(0x3f000000),
          child: Container(),
        ),
      ),
    );
  }
}
