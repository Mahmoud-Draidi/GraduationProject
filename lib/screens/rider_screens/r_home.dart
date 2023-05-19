import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/book_provider.dart';

class RHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProvider>(context);
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
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
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.message,
                                color: Color(0xffdda006),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
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
                    height: h * 0.69,
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
            if(pro.isBooked) Positioned(
              top: h*0.065,
              right: w*0.0583,
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: h*0.15,
                  width: w*0.415,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Group_3.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
           if(pro.isOrangeCase) Positioned(
                top: h*0.065,
                right: w*0.0583,
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    height: h*0.15,
                    width: w*0.415,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Group_4.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
            ),
            if(pro.isOrangeCase)Positioned(
              right: w*0.25,
              top: h*0.093,
              child: Text(
                "10:50",
                textAlign: TextAlign.center,
                style: GoogleFonts.vazirmatn(
                  color: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        endDrawer: Drawer(
          backgroundColor: Color(0x3f000000),
          child: Container(),
        ),
      ),
    );
  }
}
