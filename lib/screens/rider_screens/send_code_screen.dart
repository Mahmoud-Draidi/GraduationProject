import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/sned_code_provider.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/sign_up_screen.dart';
import 'package:mowasulatuna/widgets/driver_widgets/common_widgets/inputBox.dart';
import 'package:mowasulatuna/widgets/rider_widgets/send_code_screen_widgets/timer.dart';
import 'package:provider/provider.dart';

import '../../firebase_services/firestore_helper.dart';

class SendCodeScreen extends StatelessWidget {
  TextEditingController controllerCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SendCodeProvider>(context);
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
                          builder: (context) => SignUpScreen(),
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
                    "أدخل رمز التأكيد",
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
                    "أدخل رمز التأكيد المرسل الى رقم جوالك",
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
                      'رمز التأكيد من الجوال',
                      TextInputType.text,
                      false,
                      controllerCode,
                      // pro.codeErrorMessage,
                    // (){pro.setCodeErrorMessage(controllerCode.text);},
                    ),
                    SizedBox(
                      height: h * 0.35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pro.isInDuration ? ' ! ' : '',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.vazirmatn(
                            color: Color(0xb2f0f0f0),
                            textStyle: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          (pro.isInDuration ? 'تمت إعادة الإرسال' : ''),
                          textAlign: TextAlign.left,
                          style: GoogleFonts.vazirmatn(
                            color: Color(0xb2f0f0f0),
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
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
                              color: pro.isInDuration
                                  ? Colors.black.withOpacity(0.4)
                                  : Colors.black,
                              child: Center(
                                  child: pro.numOfClicksOnResendCode < 3
                                      ? (pro.isInDuration
                                          ? TimerScreen()
                                          : Text(
                                              "إعادة الإرسال",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.vazirmatn(
                                                color: Color(0xffdda006),
                                                textStyle: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ))
                                      : Text(
                                          "لا يمكنك إعادة الارسال",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.vazirmatn(
                                            color: Color(0xffdda006)
                                                .withOpacity(0.5),
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )),
                            ),
                            onTap: () {
                              if (pro.isInDuration ||
                                  pro.numOfClicksOnResendCode >= 3) {
                              } else {
                                pro.setIsInDuration();
                                pro.incNumOfClicksOnResendCode();
                                Timer(const Duration(seconds: 60), () {
                                  pro.setIsInDuration();
                                });
                              }

                              // if(pro.isInDuration){
                              //   pro.setCanResend();
                              //   Timer(const Duration(seconds: 5), () {
                              //     pro.setCanResend();
                              //     pro.setIsInDuration();
                              //   });
                              // }
                              // else{
                              //   ;
                              //   pro.incNumOfClicksOnResendCode();
                              //
                              //   Timer(const Duration(milliseconds: 7000), () {
                              //     pro.setIsResendCodePressed();
                              //   });
                              //   pro.setIsInDuration();
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('code :  ${controllerCode.text}');
                              // Map<String, dynamic> userData = {
                              //   'name': 'muath ',
                              //   'email': 'muathhhhh@example.com',
                              // };
                              //
                              // FirestoreHelper firestoreHelper =
                              //     FirestoreHelper();
                              //
                              // firestoreHelper
                              //     .addUserToFirestore(userData)
                              //     .then((_) {
                              //   print('User added to Firestore successfully');
                              // }).catchError((error) {
                              //   print('Error adding user to Firestore: $error');
                              // });

                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => RHome(),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: h * 0.086,
                              color: const Color(0xffdda006),
                              child: Center(
                                child: Text(
                                  "المتابعة",
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
