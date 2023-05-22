import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/booking_process_provider.dart';
import 'package:mowasulatuna/screens/common_screens/my_drawer.dart';
import 'package:mowasulatuna/screens/rider_screens/book_details.dart';
import 'package:mowasulatuna/screens/rider_screens/book_screen.dart';
import 'package:provider/provider.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import '../../providers/book_provider_passenger.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProviderPassenger>(context);
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
                      print('hello r home');
                    }
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
        body: Stack(
          children: [
            Container(
              height: h,
              width: w,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              title: "Error",
                              body: Text('هذه الخدمة فيد التطوير'),
                            ).show();
                          },
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.4,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "معلومات",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.vazirmatn(
                                    color: Color(0xb2f0f0f0),
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.message,
                                  color: Color(0xffdda006),
                                  // size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.4,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
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
                      ],
                    ),
                    SizedBox(
                      height: h * 0.65,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: w * 0.01),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.17,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/mdi_bus-marker.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.01),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: h * 0.055,
                            width: w * 0.17,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFF414141),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.location_history,
                                color: Color(0xffdda006),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.01),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (proBook.bookState == 1)
              Positioned(
                top: h * 0.065,
                right: w * 0.0583,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(),
                      ),
                    );
                  },
                  child: Container(
                    height: h * 0.15,
                    width: w * 0.415,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/grey.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            if (proBook.bookState == 2)
              Positioned(
                top: h * 0.065,
                right: w * 0.0583,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(),
                      ),
                    );
                  },
                  child: Container(
                    height: h * 0.15,
                    width: w * 0.415,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/orange.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            if (proBook.bookState == 3)
              Positioned(
                top: h * 0.065,
                right: w * 0.0583,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetails(),
                      ),
                    );
                  },
                  child: Container(
                    height: h * 0.15,
                    width: w * 0.415,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/greenCase.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        endDrawer: MyDrawer(),
      ),
    );
  }
}
