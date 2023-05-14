import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/widgets/driver_widgets/sign_in_screen_widgets/inputBox.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.28,
            color: Colors.black,
            child: Center(
              child: Text(
                "الدخول الى حسابك",
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
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: h * 0.72,
                width: w,
                color: Color(0xff272727),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: h*0.04,),
                    InputBox('رقم الجوال', TextInputType.phone, false),
                    SizedBox(
                      height: h * 0.02
                    ),
                    InputBox(
                        'كلمة المرور', TextInputType.visiblePassword, true),
                    SizedBox(
                      height: h * 0.04
                    ),
                    Container(
                      margin: EdgeInsets.only(right: w*0.13),
                      child: TextButton(
                        onPressed: (){
                        },
                        child: Text(
                          "هل نسيت كلمة المرور؟",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff70a8f1),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h / 4,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              height: h * 0.086,
                              color: Colors.black,
                              child: Center(
                                child: Text(
                                  "مستخدم جديد؟",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.vazirmatn(
                                    color: Color(0xffdda006),
                                    textStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              print('ds');
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyBus(),
                                ),
                              );
                            },
                            child: Container(
                              height: h * 0.086,
                              color: const Color(0xffdda006),
                              child: Center(
                                child: Text(
                                  "الدخول",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.vazirmatn(
                                    color: Colors.black,
                                    textStyle: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
