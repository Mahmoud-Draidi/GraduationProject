import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/edit_profile_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/widgets/one_faq.dart';
import 'package:provider/provider.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/history_details.dart';
import '../../providers/book_provider_passenger.dart';
import 'question_details.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProviderPassenger>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    bool isDriver = false;

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('FAQ')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          pro.setIndex(0);
          
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AlertDialog(
              title: Text('loading'),
              content: Container(
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          String qusetion = '';
          String answer = '';

          String uid = FirebaseAuth.instance.currentUser?.uid ?? '';


          QuerySnapshot querySnapshot = snapshot.data!;
          List<QueryDocumentSnapshot> documents = querySnapshot.docs;
          for (QueryDocumentSnapshot document in documents) {
            if (document.id == uid) {
            }
          }

          return Container(
            height: h,
            width: w,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(h * 0.10),
                // here the desired height
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
              body: SingleChildScrollView(
                child: Container(
                  height: h,
                  width: w,
                  padding: EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      pro.setIndex(pro.index+1);
                      return OneOfFAQ(pro.index, data['السؤال'], data['الجواب']);
                    }).toList(),
                  )
                ),
              ),
            ),
          );
        });
  }
}
