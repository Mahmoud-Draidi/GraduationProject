import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/firebase_services/firestoreBookHelper.dart';
import 'package:mowasulatuna/providers/booking_process_provider.dart';
import 'package:mowasulatuna/screens/rider_screens/book_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/providers/timer_provider.dart';
import 'package:mowasulatuna/widgets/timer.dart';
import 'package:mowasulatuna/widgets/timer2.dart';
import 'package:provider/provider.dart';

import '../../providers/book_provider_passenger.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro2 = Provider.of<TimerProvider>(context);
    final pro = Provider.of<BookProviderPassenger>(context);
    final proBook = Provider.of<BookingProcessProvider>(context);
    FirebaseAuth auth = FirebaseAuth.instance;

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

    String timeOfDayToString(TimeOfDay timeOfDay) {
      String hour = timeOfDay.hour.toString().padLeft(2, '0');
      String minute = timeOfDay.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }

// Store TimeOfDay in Firestore
    void storeTimeOfDay(TimeOfDay timeOfDay) {
      String timeString = timeOfDayToString(timeOfDay);
      FirebaseFirestore.instance
          .collection('bookProcess') // Replace with your collection name
          .doc(auth.currentUser!.uid) // Replace with your document ID
          .set({
        'time': timeString,
        'numOfPersons' : pro.numOfPersons,
      });
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
                  onTap: () async {
                    TimeOfDay currentTime = TimeOfDay.now();
                    if(currentTime.hour == proBook.selectedTimeOfDay.hour && currentTime.minute == proBook.selectedTimeOfDay.minute){
                      proBook.setBookStateTwo();

                      String? userId = FirebaseAuth.instance.currentUser?.uid;
                      if (userId != null) {
                        DocumentReference sourceDocRef = FirebaseFirestore.instance.collection('books1').doc(userId);
                        DocumentReference destDocRef = FirebaseFirestore.instance.collection('books2').doc(userId);
                        try {
                          // Get the data from the source document
                          DocumentSnapshot sourceSnapshot = await sourceDocRef.get();
                          if (sourceSnapshot.exists) {
                            Object? data = sourceSnapshot.data();

                            // Set the data to the destination document
                            await destDocRef.set(data);

                            // Delete the source document
                            await sourceDocRef.delete();

                            print('Document moved successfully!');
                          } else {
                            print('Source document does not exist');
                          }
                        } catch (error) {
                          print('Error moving document: $error');
                        }
                      } else {
                        print('User not logged in');
                      }

                      print('hello');
                    }

                    print('helloii');
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
              if (proBook.bookState==1)
                GestureDetector(
                  onTap: () async {
                    proBook.setBookStateZero();
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

                    String? userId = FirebaseAuth.instance.currentUser?.uid;
                    if (userId != null) {
                      DocumentReference sourceDocRef = FirebaseFirestore.instance.collection('books1').doc(userId);
                      DocumentReference destDocRef = FirebaseFirestore.instance.collection('books0').doc(userId);

                      try {
                        // Get the data from the source document
                        DocumentSnapshot sourceSnapshot = await sourceDocRef.get();
                        if (sourceSnapshot.exists) {
                          Object? data = sourceSnapshot.data();

                          // Set the data to the destination document
                          await destDocRef.set(data);

                          // Delete the source document
                          await sourceDocRef.delete();

                          print('Document moved successfully!');
                        } else {
                          print('Source document does not exist');
                        }
                      } catch (error) {
                        print('Error moving document: $error');
                      }
                    } else {
                      print('User not logged in');
                    }

                    if (pro2.start > 0) {
                      pro2.cancelTimer();
                      pro.setCanCancelBook(0);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RHome(),
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
              if (proBook.bookState == 2 || proBook.bookState == 3)
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
              if (proBook.bookState == 0)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RHome(),
                            ),
                          );
                        },
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

                          proBook.setBookStateOne();
                          print('assssssssssssssssssssssssssssssssssss${proBook.bookState}');

                          //get name of person
                          String? uid = FirebaseAuth.instance.currentUser?.uid;
                          String name = '';
                          if (uid != null) {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('your_collection').doc(uid).get();
                            if (snapshot.exists) {
                              name = snapshot.get('name') ?? '';
                            }
                          }


                          // add to books1
                          FirebaseAuth auth = FirebaseAuth.instance;
                          await FirebaseFirestore.instance
                              .collection('books1')
                              .doc(auth.currentUser!.uid)
                              .set({
                            'location': pro.locationValue,
                            'selectedTime': pro.selectedTime,
                            'bookDay': pro.bookDay,
                            'numOfPersons': pro.numOfPersons,
                            'name' : name,
                            'userID' : uid!,
                          }).then((_) {
                            print('book added to Firestore successfully');
                          }).catchError((error) {
                            print('Error adding user to Firestore: $error');
                          });

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
                            'bookState': proBook.bookState,
                          }).then((_) {
                            print('book added to Firestore successfully');
                          }).catchError((error) {
                            print('Error adding user to Firestore: $error');
                          });
                          // FirestoreHelperBooks firestoreHelper =
                          // FirestoreHelperBooks();
                          //
                          // firestoreHelper.addBookToFirestore({
                          //   'userID': auth.currentUser!.uid,
                          //   'location': pro.locationValue,
                          //   'selectedTime': pro.selectedTime,
                          //   'bookDay': pro.bookDay,
                          //   'numOfPersons': pro.numOfPersons,
                          // }).then((_) {
                          //   print('User added to Firestore successfully');
                          // }).catchError((error) {
                          //   print('Error adding user to Firestore: $error');
                          // });

                          // FirebaseAuth auth = FirebaseAuth.instance;
                          // await FirebaseFirestore.instance
                          //     .collection('passengers')
                          //     .doc(auth.currentUser!.uid)
                          //     .collection('books')
                          //     .doc(auth.currentUser!.uid)
                          //     .set({
                          //   'location': pro.locationValue,
                          //   'selectedTime': pro.selectedTime,
                          //   'bookDay': pro.bookDay,
                          //   'numOfPersons': pro.numOfPersons,
                          // }).then((_) {
                          //   print('book added to Firestore successfully');
                          // }).catchError((error) {
                          //   print('Error adding user to Firestore: $error');
                          // });
                          //
                          // FirestoreHelperBooks firestoreHelper =
                          //     FirestoreHelperBooks();
                          //
                          // firestoreHelper.addBookToFirestore({
                          //   'userID': auth.currentUser!.uid,
                          //   'location': pro.locationValue,
                          //   'selectedTime': pro.selectedTime,
                          //   'bookDay': pro.bookDay,
                          //   'numOfPersons': pro.numOfPersons,
                          // }).then((_) {
                          //   print('User added to Firestore successfully');
                          // }).catchError((error) {
                          //   print('Error adding user to Firestore: $error');
                          // });

                          // pro.setCanCancelBook(1);
                          // startTimer();
                          // Timer(const Duration(seconds: 30), () async{
                          //   pro.setCanCancelBook(2);
                          //
                          // });
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
