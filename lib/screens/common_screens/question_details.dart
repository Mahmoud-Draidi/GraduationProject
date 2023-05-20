import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/edit_profile_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/history_details.dart';
import '../../providers/book_provider.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class QuestionDetailsScreen extends StatelessWidget {
  const QuestionDetailsScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return Scaffold(
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
      
      body: Column(
        children: [
          Container(
          height: h*0.861,
          width: w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: h*.7,
                      margin: const EdgeInsets.only(top: 10, bottom: 5),
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/questionAndAnswer.png'
                          ),
                        ),
                      ),
                    ),),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
        ],
      ),
      
    );
  }
}
