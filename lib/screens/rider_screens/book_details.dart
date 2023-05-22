import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/firebase_services/firestoreBookHelper.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/providers/timer_provider.dart';
import 'package:mowasulatuna/widgets/timer.dart';
import 'package:mowasulatuna/widgets/timer2.dart';
import 'package:provider/provider.dart';

import '../../providers/book_provider.dart';
import '../../providers/current_possition.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro2 = Provider.of<TimerProvider>(context);
    final pro = Provider.of<BookProvider>(context);
    final proCurrentPosition = Provider.of<CurrentPossition>(context);

    void startTimer() {
      const oneSec = Duration(seconds: 1);
      Timer.periodic(
        oneSec,
        (Timer timer) {
          if (pro2.start == 0) {
            pro2.cancelTimer();
          } else {
            pro2.decStart();
          }
        },
      );
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
                Container(
                  margin: EdgeInsets.only(
                    top: h * 0.015,
                  ),
                  height: h * 0.053,
                  width: w * 0.38,
                  child: Image.asset('assets/images/logoText.png'),
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/bookDatailsForm.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * 0.08,
                      right: w * 0.23,
                      child: Text(
                        pro.getDetailsDayDate(),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.vazirmatn(
                          color: Color(0xb2f0f0f0),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * 0.207,
                      right: w * 0.23,
                      child: Text(
                        pro.getDetailsLocation(),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.vazirmatn(
                          color: Color(0xb2f0f0f0),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * 0.337,
                      right: w * 0.23,
                      child: Text(
                        pro.getDetailsBookTime(),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.vazirmatn(
                          color: Color(0xb2f0f0f0),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * 0.465,
                      right: w * 0.23,
                      child: Text(
                        pro.getDetailsNumOfPersons(),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.vazirmatn(
                          color: Color(0xb2f0f0f0),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * 0.594,
                      right: w * 0.23,
                      child: Text(
                        pro.getDetailsExpectedBusTime(),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.vazirmatn(
                          color: Color(0xb2f0f0f0),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h * 0.715,
                      right: w * 0.23,
                      child: Text(
                        pro.getDetailsDriverName(),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.vazirmatn(
                          color: Color(0xb2f0f0f0),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (pro.canCancelBook == 1)
                GestureDetector(
                  onTap: () async {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    await FirebaseFirestore.instance
                        .collection('passengers')
                        .doc(auth.currentUser!.uid)
                        .collection('books')
                        .doc(auth.currentUser!.uid)
                        .delete()
                        .then((_) {
                      print('delete to Firestore successfully');
                    }).catchError((error) {
                      print('Error delete to Firestore: $error');
                    });

                    if (pro2.start > 0) {
                      pro2.cancelTimer();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RHome(proCurrentPosition.getkGooglePlex()),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: h * 0.086,
                    decoration: BoxDecoration(
                      color: Color(0xffdda006),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTimer(30),
                        SizedBox(
                          width: w * 0.1,
                        ),
                        Text(
                          "إلغاء الحجز",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.vazirmatn(
                            color: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.red.shade800,
                          size: 30,
                        ),
                        SizedBox(
                          width: w * 0.08,
                        ),
                      ],
                    ),
                  ),
                ),
              if (pro.canCancelBook == 2)
                GestureDetector(
                  child: Container(
                    height: h * 0.086,
                    decoration: BoxDecoration(
                      color: Color(0xffdda006).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: w * 0.1,
                        ),
                        Text(
                          "تم الحجز",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.vazirmatn(
                            color: Colors.black.withOpacity(0.4),
                            textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.green.shade800.withOpacity(0.4),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              if (pro.canCancelBook == 0)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: h * 0.086,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "إلغاء",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.vazirmatn(
                                  color: Color(0xffdda006),
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Icon(
                                Icons.cancel_outlined,
                                color: Colors.red.shade800,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await FirebaseFirestore.instance
                              .collection('passengers')
                              .doc(auth.currentUser!.uid)
                              .collection('books')
                              .doc(auth.currentUser!.uid)
                              .set({
                            'location': pro.locationValue,
                            'selectedTime': pro.selectedTime,
                            'bookDay': pro.bookDay,
                            'numOfPersons': pro.numOfPersons,
                          }).then((_) {
                            print('book added to Firestore successfully');
                          }).catchError((error) {
                            print('Error adding user to Firestore: $error');
                          });

                          FirestoreHelperBooks firestoreHelper =
                              FirestoreHelperBooks();

                          firestoreHelper.addBookToFirestore({
                            'userID': auth.currentUser!.uid,
                            'location': pro.locationValue,
                            'selectedTime': pro.selectedTime,
                            'bookDay': pro.bookDay,
                            'numOfPersons': pro.numOfPersons,
                          }).then((_) {
                            print('User added to Firestore successfully');
                          }).catchError((error) {
                            print('Error adding user to Firestore: $error');
                          });

                          pro.setCanCancelBook(1);
                          startTimer();
                          Timer(const Duration(seconds: 30), () {
                            pro.setCanCancelBook(2);
                          });
                        },
                        child: Container(
                          height: h * 0.086,
                          decoration: BoxDecoration(
                            color: const Color(0xffdda006),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "تأكيد الحجز",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.vazirmatn(
                                  color: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.green.shade800,
                                size: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
