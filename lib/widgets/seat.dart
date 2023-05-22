import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mowasulatuna/providers/booking_process_provider.dart';
import 'package:mowasulatuna/providers/seat_provider.dart';
import 'package:mowasulatuna/widgets/circle_button.dart';
import 'package:provider/provider.dart';

class SeatWidget extends StatelessWidget {
  int typeOfSeat;
  final String name;
  final String location;

  SeatWidget(this.typeOfSeat, this.name, this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SeatProvider>(context);
    final proBook = Provider.of<BookingProcessProvider>(context);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    if (typeOfSeat == 0) {
      return GestureDetector(
        onTap: () async {
          DateTime now = DateTime.now();
          String dayName = DateFormat.EEEE().format(now);

          FirebaseAuth auth = FirebaseAuth.instance;
          await FirebaseFirestore.instance
              .collection('books3')
              .doc(auth.currentUser!.uid)
              .set({
            'location': 'undefied location',
            'selectedTime': 'undefined selected time',
            'bookDay': dayName,
            'numOfPersons': 1,
            'name': 'undefined Name',
            'userID': 'undefined user id',
          }).then((_) {
            print('book added to Firestore successfully');
          }).catchError((error) {
            print('Error adding user to Firestore: $error');
          });

          proBook.sortSeats();

          int numOfEmptySeats =
              proBook.seats.where((map) => map['state'] == 0).length;

          proBook.setIthSeat(0, {
            'state': 3,
            'name': 'undefined Name',
            'location': 'undefied location',
          });

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

          pro.setTypeOfSeat(2);
        },
        child: Container(
          height: h * 0.19,
          width: w * 0.28,
          margin: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/emptySeat.png'),
            fit: BoxFit.fill,
          )),
        ),
      );
    } else if (typeOfSeat == 1) {
      return Container(
        height: h * 0.2,
        width: w * 0.30,
        margin: EdgeInsets.only(top: 15, bottom: 15),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bookedSeat.png'),
          fit: BoxFit.fill,
        )),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Center(
                child: Container(
                  height: w * 0.09,
                  width: w * 0.09,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: IconButton(
                    icon: Text(
                      '!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () async{
                      String? userId = FirebaseAuth.instance.currentUser?.uid;



                        CollectionReference sourceDocRef = FirebaseFirestore.instance.collection('books2');
                        CollectionReference destDocRef = FirebaseFirestore.instance.collection('books0');
                        try {
                          // Get the data from the source document
                          QuerySnapshot querySnapshot = await sourceDocRef.where('name', isEqualTo: name).get();
                          // Iterate over the query snapshot and move each document to the destination collection
                          for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
                            // Get the document data
                            Object? data = documentSnapshot.data();
                            // Create the document in the destination collection
                            await destDocRef.doc(documentSnapshot.id).set(data);
                            // Delete the document from the source collection
                            await sourceDocRef.doc(documentSnapshot.id).delete();
                          }
                            print('Document moved successfully!');
                        } catch (error) {
                          print('Error moving document: $error');
                        }


                        FirebaseAuth auth = FirebaseAuth.instance;
                        proBook.setSeatState(name, 0);

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

                        pro.setTypeOfSeat(0);

                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Center(
                child: Container(
                  height: w * 0.11,
                  width: w * 0.11,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.green.withOpacity(0.9),
                        size: 27,
                      ),
                      onPressed: () async{

                        String? userId = FirebaseAuth.instance.currentUser?.uid;

                        CollectionReference sourceDocRef = FirebaseFirestore.instance.collection('books2');
                        CollectionReference destDocRef = FirebaseFirestore.instance.collection('books3');
                        try {
                          // Get the data from the source document
                          QuerySnapshot querySnapshot = await sourceDocRef.where('name', isEqualTo: name).get();
                          // Iterate over the query snapshot and move each document to the destination collection
                          for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
                            // Get the document data
                            Object? data = documentSnapshot.data();
                            // Create the document in the destination collection
                            await destDocRef.doc(documentSnapshot.id).set(data);
                            // Delete the document from the source collection
                            await sourceDocRef.doc(documentSnapshot.id).delete();
                          }
                          print('Document moved successfully!');
                        } catch (error) {
                          print('Error moving document: $error');
                        }


                        FirebaseAuth auth = FirebaseAuth.instance;
                        proBook.setSeatState(name, 3);

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

                        pro.setTypeOfSeat(2);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 17,
              top: h * 0.054,
              child: Container(
                height: h * 0.04,
                width: w * 0.2,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    name,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.vazirmatn(
                      color: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.2),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 17,
              top: h * 0.11,
              child: Container(
                height: h * 0.04,
                width: w * 0.1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    location,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.vazirmatn(
                      color: Colors.black,
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.2),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        child: Container(
          height: h * 0.19,
          width: w * 0.315,
          margin: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/ridenSeat.png'),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: [
              Positioned(
                bottom: h * 0.025,
                left: 0,
                child: Center(
                  child: Container(
                    height: w * 0.11,
                    width: w * 0.11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red.withOpacity(0.9),
                          size: 28,
                        ),
                        onPressed: () async{
                          String? userId = FirebaseAuth.instance.currentUser?.uid;

                          CollectionReference sourceDocRef = FirebaseFirestore.instance.collection('books3');
                          CollectionReference destDocRef = FirebaseFirestore.instance.collection('books0');

                          try {
                            // Get the data from the source document
                            QuerySnapshot querySnapshot = await sourceDocRef.where('name', isEqualTo: name).get();
                            // Iterate over the query snapshot and move each document to the destination collection
                            for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
                              // Get the document data
                              Object? data = documentSnapshot.data();
                              // Create the document in the destination collection
                              await destDocRef.doc(documentSnapshot.id).set(data);
                              // Delete the document from the source collection
                              await sourceDocRef.doc(documentSnapshot.id).delete();
                            }
                            print('Document moved successfully!');
                          } catch (error) {
                            print('Error moving document: $error');
                          }


                          FirebaseAuth auth = FirebaseAuth.instance;
                          proBook.setSeatState(name, 0);

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

                          // List<Map<String, dynamic>> dataList = [];
                          //
                          // try {
                          //   QuerySnapshot querySnapshot =
                          //   await FirebaseFirestore.instance.collection('yourCollectionName').get();
                          //
                          //   querySnapshot.docs.forEach((DocumentSnapshot document) {
                          //     List<Map<String, dynamic>> documentData = List<Map<String, dynamic>>.from(document.data()['yourListFieldName']);
                          //     dataList.addAll(documentData);
                          //   });
                          // } catch (e) {
                          //   print('Error reading data from Firestore: $e');
                          // }
                          //
                          // return dataList;
                          pro.setTypeOfSeat(0);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 17,
                top: h * 0.054,
                child: Container(
                  height: h * 0.04,
                  width: w * 0.2,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      name,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.vazirmatn(
                        color: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
