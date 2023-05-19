import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/sign_in_provider.dart';
import 'package:mowasulatuna/screens/common_screens/profile_screen.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/sign_up_screen.dart';
import 'package:mowasulatuna/widgets/driver_widgets/sign_in_screen_widgets/inputBox.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignInProvider>(context);
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
                color: const Color(0xff272727),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: h * 0.04,
                    ),
                    const InputBox(
                      'رقم الجوال',
                      TextInputType.phone,
                      false,
                    ),
                    SizedBox(height: h * 0.02),
                    const InputBox(
                      'كلمة المرور',
                      TextInputType.visiblePassword,
                      true,
                    ),
                    SizedBox(height: h * 0.04),
                    Container(
                      margin: EdgeInsets.only(right: w * 0.13),
                      child: TextButton(
                        onPressed: () {
                          if (!pro.isForgetPassClicked) {
                            pro.setIsForgetPassClicked();
                            pro.incNumOfClicksOnForgetPass();
                            Timer(const Duration(seconds: 3), () {
                              pro.setIsForgetPassClicked();
                            });
                          }
                        },
                        child: Text(
                          "هل نسيت كلمة المرور؟",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: pro.numOfClicksOnForgetPass <= 3
                                ? const Color(0xff70a8f1)
                                : const Color(0xff70a8f1).withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: pro.isForgetPassClicked &&
                              pro.numOfClicksOnForgetPass <= 3
                          ? h / 5 - h / 35
                          : h / 5,
                    ),
                    if (pro.numOfClicksOnForgetPass <= 3 &&
                        pro.isForgetPassClicked)
                      SizedBox(
                        height: h / 35,
                        child: Center(
                          child: Text(
                            "تم ارسال كلمة المرور الى رقم جوالك",
                            textAlign: TextAlign.right,
                            style: GoogleFonts.vazirmatn(
                              color: const Color(0xb2f0f0f0),
                              textStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: h / 40,
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
                                    color: const Color(0xffdda006),
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
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
                                    textStyle: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
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
