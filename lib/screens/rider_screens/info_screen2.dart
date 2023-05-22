import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import '../../providers/book_provider_passenger.dart';

class MyInfoScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProviderPassenger>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      child: Scaffold(
        //AppBar
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
                              'assets/images/Group_6.png'
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: h*0.095,
                      right: w*0.23,
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
                      top: h*0.25,
                      right: w*0.23,
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
                      top: h*0.4,
                      right: w*0.23,
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
                      top: h*0.55,
                      right: w*0.23,
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
                      top: h*0.705,
                      right: w*0.23,
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
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: h * 0.086,
                        decoration: BoxDecoration(
                          color: Color(0xffdda006),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "طولكرم",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.vazirmatn(
                                color: Colors.black,
                                textStyle: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  MyInfoScreenTwo(),
                              ),
                            );
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                         Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  MyInfoScreen(),
                              ),
                            );
                      },
                      child: Container(
                        height: h * 0.086,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "بيت ليد",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.vazirmatn(
                                color: Color(0xffdda006),
                                textStyle: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Color(0x3f000000),
          child: Container(),
        ),
      ),
    );
  }
}
