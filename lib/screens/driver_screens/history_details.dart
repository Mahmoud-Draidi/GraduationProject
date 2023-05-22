import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/edit_profile_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/history.dart';
import '../../providers/book_provider_passenger.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({super.key});
  

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProviderPassenger>(context);
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
                          builder: (context) =>  HistoryScreen(),
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
                          image: AssetImage(
                              'assets/images/historyDatailsFormDriver.png'
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h*0.23,
                      right: w*0.50,
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
                      top: h*0.31,
                      right: w*0.50,
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
                      top: h*0.397,
                      right: w*0.50,
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
                      top: h*0.483,
                      right: w*0.50,
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
                      top: h*0.568,
                      right: w*0.50,
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
                      top: h*0.651,
                      right: w*0.50,
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
