import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/booking_process_provider.dart';
import '../../providers/seat_provider.dart';
import '../../widgets/seat.dart';
import '../common_screens/my_drawer.dart';

class MyBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proBook = Provider.of<BookingProcessProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h,
      width: w,
      child: Scaffold(
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
                    onTap: ()async{
                      // get booked persoms from books2
                      List<Map<String, dynamic>>? documents = [];
                      try {
                        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('books2').get();
                        documents = querySnapshot.docs.map((doc) => doc.data()).cast<Map<String, dynamic>>().toList();
                      } catch (error) {
                        print('Error retrieving documents: $error');
                      }
                      print('aaaaaaaaaaaaaaaaaaaaaasssssssssssssdddddddddddddd');
                      proBook.setDocumentOfBooks2(documents!);
                      print(documents);


                      //sort list of seats
                      proBook.sortSeats();

                      //count num of empty seats
                      int numOfEmptySeats = proBook.seats.where((map) => map['state'] == 0).length;


                      //put booking persons to seats
                      proBook.putBookedPersonsToSeats(numOfEmptySeats);


                      // set seats of bus in firestore
                      FirebaseAuth auth = FirebaseAuth.instance;
                      await FirebaseFirestore.instance
                          .collection('drivers')
                          .doc(auth.currentUser!.uid)
                          .collection('seats')
                          .doc(auth.currentUser!.uid)
                          .set({
                        'seatsList':proBook.seats,
                      }).then((_) {
                        print('book added to Firestore successfully');
                      }).catchError((error) {
                        print('Error adding user to Firestore: $error');
                      });


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
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                width: w * 0.98,
                height: h * 0.83,
                padding: EdgeInsets.all(5),
                color: Color(0xff272727),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: w/1000,),
                        Container(
                          height: w*0.28,
                          width: w*0.28,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/steeringIcon.png')
                            )
                          ),
                        ),
                        // SeatWidget(pro.seats[0].seatCase, pro.seats[0].name, pro.seats[0].location),
                        SeatWidget(proBook.seats[0]['state'], proBook.seats[0]['name'], proBook.seats[0]['location']),
                        SizedBox(width: w/1000,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SeatWidget(proBook.seats[1]['state'],proBook.seats[1]['name'] , proBook.seats[1]['location']),
                        SeatWidget(proBook.seats[2]['state'], proBook.seats[2]['name'], proBook.seats[2]['location']),
                        SeatWidget(proBook.seats[3]['state'], proBook.seats[3]['name'], proBook.seats[3]['location']),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SeatWidget(proBook.seats[4]['state'], proBook.seats[4]['name'], proBook.seats[4]['location']),
                        SeatWidget(proBook.seats[5]['state'], proBook.seats[5]['name'], proBook.seats[5]['location']),
                        SeatWidget(proBook.seats[6]['state'], proBook.seats[6]['name'], proBook.seats[6]['location']),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          endDrawer: MyDrawer()
      ),
    );
  }
}
