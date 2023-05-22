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
import '../../providers/book_provider_passenger.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class QuestionDetailsScreen extends StatelessWidget {
  final int num;
  final String question;
  final String answer;

  const QuestionDetailsScreen(this.num, this.question, this.answer,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProviderPassenger>(context);
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
          padding: EdgeInsets.all(25),
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
                  children: [
                    Container(
                      height: h * 0.7,
                      margin: const EdgeInsets.only(top: 10, bottom: 5),
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/questionAndAnswer.png'),
                          )
                      ),
                    ),
                    Positioned(
                      top: h*0.03,
                      right: w*0.63,
                      child: Text(
                        num.toString(),
                        maxLines: 1, // Set the maximum number of lines
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.vazirmatn(
                          color: Color(0xffdda006),
                          textStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h*0.09,
                      right: w*0.07,
                      child: Container(
                        width: w*0.75,
                        child: Text(
                          question,
                          maxLines: 2, // Set the maximum number of lines
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.vazirmatn(
                            color: Color(0xb2f0f0f0),
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h*0.22,
                      right: w*0.2,
                      child: Container(
                        width: w*0.5,
                        child: Text(
                          answer,
                          maxLines: 10, // Set the maximum number of lines
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.vazirmatn(
                            color: Color(0xb2f0f0f0),
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
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
      ),
    );
  }
}
