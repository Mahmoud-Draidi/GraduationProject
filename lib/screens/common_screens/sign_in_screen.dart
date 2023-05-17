import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/sign_in_screen_provider.dart';
import 'package:mowasulatuna/providers/sign_in_screen_provider.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/sign_up_screen.dart';
import 'package:mowasulatuna/widgets/driver_widgets/common_widgets/MyInputBox.dart';
import 'package:mowasulatuna/widgets/driver_widgets/common_widgets/inputBox.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerTest = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignInScreenProvider>(context);

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
                    SizedBox(
                      height: h * 0.04,
                    ),
                    InputBox(
                      'رقم الجوال',
                      TextInputType.phone,
                      false,
                      controllerPhone,
                      // pro.phoneErrorMessage,
                        // pro.setPhoneErrorMessage,
                    ),
                    SizedBox(height: h * 0.02),
                    InputBox(
                      'كلمة المرور',
                      TextInputType.visiblePassword,
                      true,
                      controllerPass,
                      // pro.passErrorMessage,
                        // pro.setPassErrorMessage,
                    ),
                    SizedBox(height: h * 0.04),
                    // MyInputBox('تجريب', TextInputType.emailAddress, false, controllerTest),
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
                                ? Color(0xff70a8f1)
                                : Color(0xff70a8f1).withOpacity(0.5),
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
                      Container(
                        height: h / 35,
                        child: Center(
                          child: Text(
                            "تم ارسال كلمة المرور الى رقم جوالك",
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
                                    color: Color(0xffdda006),
                                    textStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              print(
                                  'phone : ${controllerPhone.text} ____ password : ${controllerPass.text}');
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
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

// Container(
//   margin: EdgeInsets.only(right: w * 0.13),
//   height: h * 0.1,
//   width: w * 0.75,
//   decoration: const BoxDecoration(
//     border: Border(
//       bottom: BorderSide(
//         color: Colors.black, // Set the color of the border
//         width: 1.0,
//       ),
//     ),
//   ),
//   child: Column(
//     children: [
//       Container(
//         width: w * 0.75,
//         child: Text(
//           'رقم الجوال',
//           textAlign: TextAlign.right,
//           style: GoogleFonts.vazirmatn(
//             color: Color(0xb2f0f0f0),
//             textStyle: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: TextField(
//           controller: controllerPhone,
//           textAlign: TextAlign.end,
//           style: GoogleFonts.vazirmatn(
//             color: Color(0xb2f0f0f0),
//             textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
//           ),
//           keyboardType: TextInputType.phone,
//           keyboardAppearance: Brightness.dark,
//         ),
//       ),
//     ],
//   ),
// ),

// Container(
//   margin: EdgeInsets.only(right: w * 0.13),
//   height: h * 0.1,
//   width: w * 0.75,
//   decoration: const BoxDecoration(
//     border: Border(
//       bottom: BorderSide(
//         color: Colors.black, // Set the color of the border
//         width: 1.0,
//       ),
//     ),
//   ),
//   child: Column(
//     children: [
//       Container(
//         width: w * 0.75,
//         child: Text(
//           'كلمة المرور',
//           textAlign: TextAlign.right,
//           style: GoogleFonts.vazirmatn(
//             color: Color(0xb2f0f0f0),
//             textStyle: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         child: TextField(
//           controller: controllerPass,
//           // onChanged: (String t){
//           //    t = controllerPass.text;
//           // },
//           textAlign: TextAlign.end,
//
//           style: GoogleFonts.vazirmatn(
//             color: Color(0xb2f0f0f0),
//             textStyle:
//             const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
//           ),
//           decoration: InputDecoration(
//
//             prefixIcon: pro.showPass
//                 ? IconButton(
//               onPressed: () {
//                 pro.setShowPass();
//               },
//               icon: Icon(
//                 Icons.remove_red_eye,
//               ),
//             )
//                 : IconButton(
//               onPressed: () {
//                 pro.setShowPass();
//               },
//               icon: Icon(
//                 Icons.visibility_off,
//               ),
//
//             ),
//           ),
//           keyboardType: TextInputType.visiblePassword,
//           keyboardAppearance: Brightness.dark,
//           obscureText: !pro.showPass,
//         ),
//       ),
//     ],
//   ),
// ),
