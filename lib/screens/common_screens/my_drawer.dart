

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/help_screen.dart';
import 'package:mowasulatuna/screens/common_screens/profile_screen.dart';
import 'package:mowasulatuna/screens/common_screens/sign_in_screen.dart';

import '../rider_screens/history.dart';
import '../rider_screens/r_home.dart';
import 'question.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection(isDriver?'drivers':'passengers').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
          String userName = '';
          QuerySnapshot querySnapshot = snapshot.data!;
          List<QueryDocumentSnapshot> documents = querySnapshot.docs;
          for (QueryDocumentSnapshot document in documents) {
            if (document.id == uid) {
              userName = document.get('name') ?? '';
              break;
            }
          }
          List<String> fullName = userName.split(' ');
          String doubleName = '${fullName[0]} ${fullName[3]}';

          FirebaseAuth auth = FirebaseAuth.instance;

          return Drawer(
            child: Container(
              color: const Color.fromRGBO(44, 43, 43, 0.737),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  doubleName,
                                  textAlign: TextAlign.end,
                                  textScaleFactor: 2.4,
                                  style: GoogleFonts.vazirmatn(
                                    color: const Color(0xfff0f0f0),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>  RHome(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xffdda006),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.015,
                          ),
                          Container(
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
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: h * 0.022),
                    padding: EdgeInsets.only(top: h * 0.12, right: w * 0.13),
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "الملف الشخصي",
                            style: GoogleFonts.vazirmatn(
                              color: const Color(0xfff0f0f0),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color(0xffdda006), // Specify the border color
                                width: 2.0, // Specify the border width
                              ),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.person,
                              color: Color(0xffdda006),
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: h * 0.022),
                    padding: EdgeInsets.only(right: w * 0.13),
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HistoryScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "سجل الرحلات",
                            style: GoogleFonts.vazirmatn(
                              color: const Color(0xfff0f0f0),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color(0xffdda006), // Specify the border color
                                width: 2.0, // Specify the border width
                              ),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.history,
                              color: Color(0xffdda006),
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: h * 0.022),
                    padding: EdgeInsets.only(right: w * 0.13),
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuestionScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "اسئلة متكررة",
                            style: GoogleFonts.vazirmatn(
                              color: const Color(0xfff0f0f0),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color(0xffdda006), // Specify the border color
                                width: 2.0, // Specify the border width
                              ),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.repartition,
                              color: Color(0xffdda006),
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: h * 0.022),
                    padding: EdgeInsets.only(right: w * 0.13),
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "طلب المساعدة",
                            style: GoogleFonts.vazirmatn(
                              color: const Color(0xfff0f0f0),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color(0xffdda006), // Specify the border color
                                width: 2.0, // Specify the border width
                              ),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.help,
                              color: Color(0xffdda006),
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: h * 0.022),
                    padding: EdgeInsets.only(right: w * 0.13),
                    width: w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "تسجيل الخروج",
                            style: GoogleFonts.vazirmatn(
                              color: const Color(0xfff0f0f0),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color(0xffdda006), // Specify the border color
                                width: 2.0, // Specify the border width
                              ),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.exit_to_app,
                              color: Color(0xffdda006),
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
  }