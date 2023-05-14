import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/sned_code_provider.dart';
import 'package:mowasulatuna/screens/common_screens/sign_in_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/widgets/driver_widgets/sign_in_screen_widgets/inputBox.dart';
import 'package:mowasulatuna/widgets/rider_widgets/send_code_screen_widgets/timer.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
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
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    icon: Icon(
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
                    "أنشئ حساباََ جديداََ",
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
                Container(
                  padding: EdgeInsets.only(right: w * 0.13),
                  child: Text(
                    "أنشئ حساباََ باستخدام رقم الجوال",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.vazirmatn(
                      color: Color(0xb2f0f0f0),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                color: Color(0xff272727),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InputBox(
                      'الاسم الرباعي',
                      TextInputType.text,
                      false,
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'رقم الجوال',
                      TextInputType.phone,
                      false,
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'البريد الإلكتروني',
                      TextInputType.emailAddress,
                      false,
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'كلمة المرور',
                      TextInputType.visiblePassword,
                      true,
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'أعد تكرار كلمة المرور',
                      TextInputType.visiblePassword,
                      true,
                    ),
                    SizedBox(height: h * 0.03),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SendCodeScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: h * 0.086,
                        color: const Color(0xffdda006),
                        child: Center(
                          child: Text(
                            "إنشاء الحساب",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.vazirmatn(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
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
        ],
      ),
    );
  }
}
