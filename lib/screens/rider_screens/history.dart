import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/edit_profile_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/history_details.dart';
import '../../providers/book_provider.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return Scaffold(
      
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.2,
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
                          //MyBus() orrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr RHome()
                          builder: (context) =>  MyBus(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xffdda006),
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 170,
                ),
                Container(
                  padding: EdgeInsets.only(right: w * 0.13),
                  child: Text(
                    "سجل الرحلات",
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
              ],
            ),
          ),
          Container(
          height: h*0.8,
          width: w,
          decoration: BoxDecoration(
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
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HistoryDetails(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/OneOfHistory.png'
                          ),
                        ),
                      ),
                    ),),
                    Positioned(
                      top: h*0.4,
                      right: w*0.15,
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
                      top: h*0.4,
                      right: w*0.59,
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
