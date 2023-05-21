import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/edit_profile_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final currentTime = DateTime.now();
    final hour = currentTime.hour + 3;

    String greeting;

    if (hour < 12) {
      greeting = 'صباح الخير';
    } else if (hour < 18) {
      greeting = 'مساء الخير';
    } else {
      greeting = 'مساء الخير';
    }

    IconData getIconBasedOnTime() {
      if (hour >= 6 && hour < 18) {
        // Daytime, return the daytime icon
        return Icons.wb_sunny;
      } else {
        // Nighttime, return the nighttime icon
        return Icons.nights_stay;
      }
    }

    bool isDriver = false;

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection(isDriver ? 'drivers' : 'passengers')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AlertDialog(
              title: Text('loading' ),
              content: Container(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

          //set name
          String userName = 'user name';
          String phoneNum = '+9725********';
          String email = "example@gmail.com";
          String pass = '********';
          int rate = 5;

          QuerySnapshot querySnapshot = snapshot.data!;
          List<QueryDocumentSnapshot> documents = querySnapshot.docs;
          for (QueryDocumentSnapshot document in documents) {
            if (document.id == uid) {
              userName = document.get('name') ?? '';
              phoneNum = document.get('phone') ?? '';
              email = document.get('email') ?? '';
              pass = document.get('password') ?? '';
              break;
            }
          }
          List<String> fullName = userName.split(' ');
          String doubleName = '${fullName[0]} ${fullName[3]}';

          return Scaffold(
            body: Column(
              children: [
                Container(
                  width: w,
                  height: h * 0.28,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: w * 0.09),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RHome(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Color(0xffdda006),
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h / 170,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: w * 0.13),
                        child: Text(
                                doubleName,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.vazirmatn(
                                  color: const Color(0xfff0f0f0),
                                  textStyle: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: w * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              greeting,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.vazirmatn(
                                color: const Color(0xfff0f0f0),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(getIconBasedOnTime()),
                                onPressed: () {
                                  print(hour);
                                },
                                color: const Color(0xffdda006),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: h * 0.72,
                      width: w,
                      color: const Color(0xff272727),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: h * 0.054,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: w * 0.13),
                              height: h * 0.1,
                              width: w * 0.75,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors
                                        .black, // Set the color of the border
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child:  Text(
                                      "الاسم الرباعي\n $userName",
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.vazirmatn(
                                        color: const Color(0xe5f0f0f0),
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(height: h * 0.017),
                            Container(
                              margin: EdgeInsets.only(right: w * 0.13),
                              height: h * 0.1,
                              width: w * 0.75,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors
                                        .black, // Set the color of the border
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                      "رقم الجوال\n $phoneNum",
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.vazirmatn(
                                        color: const Color(0xe5f0f0f0),
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(height: h * 0.017),
                            Container(
                              margin: EdgeInsets.only(right: w * 0.13),
                              height: h * 0.1,
                              width: w * 0.75,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors
                                        .black, // Set the color of the border
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child:Text(
                                      "البريد الالكتروني\n $email",
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.vazirmatn(
                                        color: const Color(0xe5f0f0f0),
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(height: h * 0.017),
                            Container(
                              margin: EdgeInsets.only(right: w * 0.13),
                              height: h * 0.1,
                              width: w * 0.75,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors
                                        .black, // Set the color of the border
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Text(
                                "تقييمي\n $rate",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.vazirmatn(
                                  color: const Color(0xe5f0f0f0),
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.109),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfileScreen(doubleName,phoneNum,userName,email,pass),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: h * 0.086,
                                  color: const Color(0xffdda006),
                                  child: Center(
                                    child: Text(
                                      "تعديل معلومات الحساب",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.vazirmatn(
                                        color: Colors.black,
                                        textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
