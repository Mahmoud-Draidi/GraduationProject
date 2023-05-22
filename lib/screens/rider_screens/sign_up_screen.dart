import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/functions/sign_up_screen_functions.dart';
import 'package:mowasulatuna/models/passenger.dart';
import 'package:mowasulatuna/providers/sned_code_provider.dart';
import 'package:mowasulatuna/screens/common_screens/sign_in_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/widgets/inputBox.dart';
import 'package:mowasulatuna/widgets/timer.dart';
import 'package:provider/provider.dart';

import '../../providers/current_possition.dart';
import '../../providers/sign_up_screen_provider.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerRepeatPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final proCurrentPosition = Provider.of<CurrentPossition>(context);

    validate() {
      if (SignUpScreenFunctions.validateNameBoolean(controllerName.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(
              SignUpScreenFunctions.validateNameString(controllerName.text)),
        ).show();
      } else if (SignUpScreenFunctions.validatePhoneBoolean(
              controllerPhone.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(
              SignUpScreenFunctions.validatePhoneString(controllerPhone.text)),
        ).show();
      } else if (SignUpScreenFunctions.validateEmailBoolean(
              controllerEmail.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(
              SignUpScreenFunctions.validateEmailString(controllerEmail.text)),
        ).show();
      } else if (SignUpScreenFunctions.validatePassBoolean(
              controllerPass.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(
              SignUpScreenFunctions.validatePassString(controllerPass.text)),
        ).show();
      } else if (SignUpScreenFunctions.validateRepeatePassBoolean(
              controllerPass.text, controllerRepeatPass.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(SignUpScreenFunctions.validateRepeatePassString(
              controllerPass.text, controllerRepeatPass.text)),
        ).show();
      }
    }

    signUp() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('please wiat! fffffffffffffffffff'),
                content: Container(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            });
        // adding
        final credential = await auth.createUserWithEmailAndPassword(
          email: controllerEmail.text,
          password: controllerPass.text,
        );
        print('yyyyyyyyyyyyyyyyyyy  ${controllerEmail.text}');
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            title: "Error",
            body: Text('The password is weak.'),
          ).show();
          print('The password provided is too weak. llllllllllllllllllll');
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            title: "Error",
            body: Text('The account already exists for that email.'),
          ).show();
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    final pro = Provider.of<SignUpScreenProvider>(context);

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
                      onTap: () async {
                        validate();
                        FirebaseFirestore.instance
                            .collection('passengers')
                            .get()
                            .then((QuerySnapshot querySnapshot) async {
                          bool isPhoneExist = false; // Initialize the flag
                          querySnapshot.docs.forEach((doc) {
                            print(
                                'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
                            print(doc["phone"]);
                            if (doc['phone'] == controllerPhone.text) {
                              isPhoneExist =
                                  true; // Set the flag if phone number exists
                              AwesomeDialog(
                                context: context,
                                title: "Error",
                                body: Text('This Phone Number already exists'),
                              ).show();
                            }
                          });

                          if (!isPhoneExist) {
                            pro.setShowDialogTrue();

                            if (pro.showDialog) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title:
                                        Text('please wait!...phone not exsits'),
                                    content: Container(
                                      height: 50,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            // Verify phone number only if it does not exist
                            if (!isPhoneExist) {
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: controllerPhone.text,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) async {
                                  print(
                                      '111111111111111111111111111111111111111111');
                                  UserCredential? response = await signUp();
                                  if (response != null) {
                                    // Passenger p = Passenger(name: controllerName.text,);
                                    await FirebaseFirestore.instance
                                        .collection('passengers')
                                        .doc(response.user!.uid)
                                        .set({
                                      'name': controllerName.text,
                                      'phone': controllerPhone.text,
                                      'email': controllerEmail.text,
                                      'password': controllerPass.text,
                                    }).then((_) {
                                      print(
                                          'User added to Firestore successfully');
                                    }).catchError((error) {
                                      print(
                                          'Error adding user to Firestore: $error');
                                    });
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RHome(
                                            proCurrentPosition
                                                .getkGooglePlex()),
                                      ),
                                    );
                                  }
                                },
                                verificationFailed: (FirebaseAuthException e) {
                                  print('222222222222222222222222222222222');
                                  pro.setShowDialogFalse();
                                  Navigator.of(context).pop();
                                  AwesomeDialog(
                                    context: context,
                                    title: "Error",
                                    body: Text(e.code),
                                  ).show();
                                  print(e.code);
                                  // pro.setShowDialogFalse();
                                },
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  print(
                                      '333333333333333333333333333333333333333');
                                  pro.setShowDialogFalse();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SendCodeScreen(
                                          verificationID: verificationId,
                                          name: controllerName.text,
                                          phone: controllerPhone.text,
                                          email: controllerEmail.text,
                                          pass: controllerPass.text),
                                    ),
                                  );
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                                timeout: const Duration(seconds: 60),
                              );
                            }
                          }
                        });

                        // validate();
                        //
                        //  FirebaseFirestore.instance
                        //     .collection('passengers')
                        //     .get()
                        //     .then((QuerySnapshot querySnapshot) {
                        //   querySnapshot.docs.forEach((doc) {
                        //     print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
                        //     print(doc["phone"]);
                        //     if (doc['phone'] == controllerPhone.text) {
                        //       pro.setIsPhoneExistTrue();
                        //       AwesomeDialog(
                        //         context: context,
                        //         title: "Error",
                        //         body: Text(
                        //           'This Phone Number is already exsits',
                        //         ),
                        //       ).show();
                        //     }
                        //   });
                        // });
                        //
                        // if(!pro.isPhoneExist){
                        //   pro.setShowDialogTrue();
                        //
                        //   if (pro.showDialog) {
                        //     showDialog(
                        //         context: context,
                        //         builder: (context) {
                        //           return AlertDialog(
                        //             title: Text('please wiat!'),
                        //             content: Container(
                        //               height: 50,
                        //               child: Center(
                        //                 child: CircularProgressIndicator(),
                        //               ),
                        //             ),
                        //           );
                        //         });
                        //   }
                        //   await FirebaseAuth.instance.verifyPhoneNumber(
                        //     phoneNumber: controllerPhone.text,
                        //     verificationCompleted:
                        //         (PhoneAuthCredential credential) async {
                        //       print('111111111111111111111111111111111111111111');
                        //       UserCredential? response = await signUp();
                        //       if (response != null) {
                        //         // Passenger p = Passenger(name: controllerName.text,);
                        //         await FirebaseFirestore.instance
                        //             .collection('passengers')
                        //             .add({
                        //           'name': controllerName.text,
                        //           'phone': controllerPhone.text,
                        //           'email': controllerEmail.text,
                        //           'password': controllerPass.text,
                        //         }).then((_) {
                        //           print('User added to Firestore successfully');
                        //         }).catchError((error) {
                        //           print('Error adding user to Firestore: $error');
                        //         });
                        //         Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) => RHome(),
                        //           ),
                        //         );
                        //       }
                        //     },
                        //     verificationFailed: (FirebaseAuthException e) {
                        //       print('222222222222222222222222222222222');
                        //       pro.setShowDialogFalse();
                        //       Navigator.of(context).pop();
                        //       AwesomeDialog(
                        //         context: context,
                        //         title: "Error",
                        //         body: Text(e.code),
                        //       ).show();
                        //       print(e.code);
                        //       // pro.setShowDialogFalse();
                        //     },
                        //     codeSent: (String verificationId, int? resendToken) {
                        //       print('333333333333333333333333333333333333333');
                        //       pro.setShowDialogFalse();
                        //       Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => SendCodeScreen(
                        //               verificationID: verificationId,
                        //               name: controllerName.text,
                        //               phone: controllerPhone.text,
                        //               email: controllerEmail.text,
                        //               pass: controllerPass.text),
                        //         ),
                        //       );
                        //     },
                        //     codeAutoRetrievalTimeout: (String verificationId) {},
                        //     timeout: const Duration(seconds: 60),
                        //   );
                        // }

                        print(
                            'name : ${controllerName.text} ____ phone : ${controllerPhone.text}___ email : ${controllerEmail.text}____ password : ${controllerPass.text}____ repeatPass : ${controllerRepeatPass.text}');
                        print(
                            'Name :${SignUpScreenFunctions.validateNameBoolean(controllerName.text)}____${SignUpScreenFunctions.validateNameString(controllerName.text)}');
                        print(
                            'phone :${SignUpScreenFunctions.validatePhoneBoolean(controllerPhone.text)}____${SignUpScreenFunctions.validatePhoneString(controllerPhone.text)}');
                        print(
                            'email :${SignUpScreenFunctions.validateEmailBoolean(controllerEmail.text)}____${SignUpScreenFunctions.validateEmailString(controllerEmail.text)}');
                        print(
                            'Name :${SignUpScreenFunctions.validatePassBoolean(controllerPass.text)}____${SignUpScreenFunctions.validatePassString(controllerPass.text)}');
                        print(
                            'Name :${SignUpScreenFunctions.validateRepeatePassBoolean(controllerPass.text, controllerRepeatPass.text)}____${SignUpScreenFunctions.validateRepeatePassString(controllerPass.text, controllerRepeatPass.text)}');
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
