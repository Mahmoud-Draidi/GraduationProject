import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/functions/sign_up_screen_functions.dart';
import 'package:mowasulatuna/providers/sned_code_provider.dart';
import 'package:mowasulatuna/screens/common_screens/sign_in_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/widgets/driver_widgets/common_widgets/inputBox.dart';
import 'package:mowasulatuna/widgets/rider_widgets/send_code_screen_widgets/timer.dart';
import 'package:provider/provider.dart';

import '../../providers/sign_up_screen_provider.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerRepeatPass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // final pro = Provider.of<SignUpScreenProvider>(context);

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
                      controllerName,
                      // pro.nameErrorMessage,
                     // (){pro.setNameErrorMessage(controllerName.text);},
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'رقم الجوال',
                      TextInputType.phone,
                      false,
                      controllerPhone,
                      // pro.phoneErrorMessage,
                        // (){pro.setPhoneErrorMessage(controllerPhone.text);},
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'البريد الإلكتروني',
                      TextInputType.emailAddress,
                      false,
                      controllerEmail,
                      // pro.emailErrorMessage,
                        // (){pro.setEmailErrorMessage(controllerEmail.text);},
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'كلمة المرور',
                      TextInputType.visiblePassword,
                      true,
                        controllerPass,
                      // pro.passErrorMessage,
                        // (){pro.setPassErrorMessage(controllerPass.text);},
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'أعد تكرار كلمة المرور',
                      TextInputType.visiblePassword,
                      true,
                      controllerRepeatPass,
                      // pro.repeatePassErrorMessage,
                        // (){pro.setRepeatPassErrorMessage(controllerRepeatPass.text);},
                    ),
                    SizedBox(height: h * 0.03),
                    GestureDetector(
                      onTap: () {

                        print('name : ${controllerName.text} ____ phone : ${controllerPhone.text}___ email : ${controllerEmail.text}____ password : ${controllerPass.text}____ repeatPass : ${controllerRepeatPass.text}');
                        print('Name :${SignUpScreenFunctions.validateNameBoolean(controllerName.text)}____${SignUpScreenFunctions.validateNameString(controllerName.text)}');
                        print('phone :${SignUpScreenFunctions.validatePhoneBoolean(controllerPhone.text)}____${SignUpScreenFunctions.validatePhoneString(controllerPhone.text)}');
                        print('email :${SignUpScreenFunctions.validateEmailBoolean(controllerEmail.text)}____${SignUpScreenFunctions.validateEmailString(controllerEmail.text)}');
                        print('Name :${SignUpScreenFunctions.validatePassBoolean(controllerPass.text)}____${SignUpScreenFunctions.validatePassString(controllerPass.text)}');
                        print('Name :${SignUpScreenFunctions.validateRepeatePassBoolean(controllerPass.text, controllerRepeatPass.text)}____${SignUpScreenFunctions.validateRepeatePassString(controllerPass.text, controllerRepeatPass.text)}');
                        // print(SignUpScreenFunctions.validateName(controllerName.text));
                        // print(SignUpScreenFunctions.validateEmail(controllerEmail.text));
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SendCodeScreen(),
                        //   ),
                        // );
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
