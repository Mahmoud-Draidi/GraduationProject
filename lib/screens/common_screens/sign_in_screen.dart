import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/firebase_services/firestore_helper_driver.dart';
import 'package:mowasulatuna/providers/sign_in_screen_provider.dart';
import 'package:mowasulatuna/providers/sign_in_screen_provider.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:mowasulatuna/screens/rider_screens/r_home.dart';
import 'package:mowasulatuna/screens/rider_screens/send_code_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/sign_up_screen.dart';
import 'package:mowasulatuna/widgets/inputBox.dart';
import 'package:provider/provider.dart';
import '../../firebase_services/firestore_helper.dart';
import '../../providers/user_type_provider.dart';

class SignInScreen extends StatelessWidget {



  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  // TextEditingController controllerTest = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final proType = Provider.of<UserTypeProvider>(context);
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
                    // Container(
                    //   margin: EdgeInsets.only(right: w * 0.13),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       if (!pro.isForgetPassClicked) {
                    //         pro.setIsForgetPassClicked();
                    //         pro.incNumOfClicksOnForgetPass();
                    //         Timer(const Duration(seconds: 3), () {
                    //           pro.setIsForgetPassClicked();
                    //         });
                    //       }
                    //     },
                    //     child: Text(
                    //       "هل نسيت كلمة المرور؟",
                    //       textAlign: TextAlign.right,
                    //       style: TextStyle(
                    //         color: pro.numOfClicksOnForgetPass <= 3
                    //             ? Color(0xff70a8f1)
                    //             : Color(0xff70a8f1).withOpacity(0.5),
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                            onTap: () async {
                              final auth = await FirebaseAuth.instance;
                              FirestoreHelperDriver firestoreHelperDriver =
                                  FirestoreHelperDriver();
                              firestoreHelperDriver
                                  .getAllUsersFromFirestore()
                                  .then((users) {
                                for (Map<String, dynamic> user in users) {
                                  print(user['password']);
                                  print(controllerPass.text);
                                  print(user['phone']);
                                  print(controllerPhone.text);
                                  print(user['email']);
                                  if (controllerPhone.text == user['phone'] &&
                                      controllerPass.text == user['password']) {
                                    print(
                                        '010101010010101001000101010100101010100');
                                    try {
                                      auth.signInWithEmailAndPassword(
                                        email: user['email'],
                                        password: controllerPass.text,
                                      );
                                      proType.setIsDriverTrue();

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyBus(),
                                        ),
                                      );
                                      print(
                                          'ioooioioioioioioioioioioioioioioioioioioioioioioioioio');
                                      print('in try   :  ${auth.currentUser}');
                                      // credential.user.uid
                                      // FirebaseAuth.instance.currentUser.uid
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        print('No user found for that email.');
                                      } else if (e.code == 'wrong-password') {
                                        print(
                                            'Wrong password provided for that user.');
                                      }
                                    }
                                  }
                                }
                              }).catchError((error) {
                                print(
                                    'Error retrieving users from Firestore: $error');
                              });
                              FirestoreHelper firestoreHelper =
                                  FirestoreHelper();
                              firestoreHelper
                                  .getAllUsersFromFirestore()
                                  .then((users) {
                                for (Map<String, dynamic> user in users) {
                                  print(user['password']);
                                  print(controllerPass.text);
                                  print(user['phone']);
                                  print(controllerPhone.text);
                                  print(user['email']);

                                  print(
                                      '0000000000000000000000000000000000000000000000');
                                  try {
                                    print(
                                        'q[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[');
                                    if (controllerPhone.text == user['phone'] &&
                                        controllerPass.text ==
                                            user['password']) {
                                      auth.signInWithEmailAndPassword(
                                        email: user['email'],
                                        password: controllerPass.text,
                                      );
                                      proType.setIsDriverTrue();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RHome(),
                                        ),
                                      );
                                      print(
                                          'ioooioioioioioioioioioioioioioioioioioioioioioioioioio');
                                      print('in try   :  ${auth.currentUser}');
                                    } else if (controllerPhone.text ==
                                            user['phone'] &&
                                        controllerPass.text !=
                                            user['password']) {
                                      AwesomeDialog(
                                        context: context,
                                        title: "Error",
                                        body: Text('your password is wrong'),
                                      ).show();
                                      print('your password is wrong');
                                    } else {
                                      // AwesomeDialog(
                                      //   context: context,
                                      //   title: "Error",
                                      //   body: Text('invalid phone number'),
                                      // ).show();
                                      // print('invalid phone number');
                                    }

                                    // credential.user.uid
                                    // FirebaseAuth.instance.currentUser.uid
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');
                                    } else if (e.code == 'wrong-password') {
                                      print(
                                          'Wrong password provided for that user.');
                                    }
                                  }
                                }
                              }).catchError((error) {
                                print(
                                    'Error retrieving users from Firestore: $error');
                              });

                              // print(FirebaseAuth.instance.currentUser);
                              // try {
                              //   final credential = await FirebaseAuth.instance
                              //       .signInWithEmailAndPassword(
                              //     email: '${controllerPhone.text}@gmail.com',
                              //     password: controllerPass.text,
                              //   );
                              //   Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => RHome(),
                              //     ),
                              //   );
                              //   print('ioooioioioioioioioioioioioioioioioioioioioioioioioioio');
                              //   print(credential.user);
                              //   // credential.user.uid
                              //   // FirebaseAuth.instance.currentUser.uid
                              // } on FirebaseAuthException catch (e) {
                              //   if (e.code == 'user-not-found') {
                              //     print('No user found for that email.');
                              //   } else if (e.code == 'wrong-password') {
                              //     print(
                              //         'Wrong password provided for that user.');
                              //   }
                              // }

                              // pro.setShowDialogTrue();
                              // if(pro.showDialog){
                              //   showDialog(
                              //     barrierDismissible: false,
                              //     context: context,
                              //     builder: (_) {
                              //       return Dialog(
                              //         child : CircularProgressIndicator(),
                              //       );
                              //     }
                              //   );
                              // };

                              //   FirebaseAuth auth = FirebaseAuth.instance;
                              //   await FirebaseAuth.instance.verifyPhoneNumber(
                              //     phoneNumber: controllerPhone.text,
                              //     verificationCompleted: (PhoneAuthCredential credential) async{
                              //       print('111111111111111111111111111111111111111111');
                              //       await auth.signInWithCredential(credential);
                              //     },
                              //     verificationFailed: (FirebaseAuthException e) {
                              //       print('222222222222222222222222222222222');
                              //         print(e.code);
                              //       // pro.setShowDialogFalse();
                              //     },
                              //     codeSent: (String verificationId, int? resendToken) {
                              //       print('333333333333333333333333333333333333333');
                              //       // pro.setShowDialogFalse();

                              //     },
                              //     codeAutoRetrievalTimeout: (String verificationId) {
                              //     },
                              //     timeout: const Duration(seconds: 60),
                              //   );
                              //
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

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 16.0),
                Text(
                  message,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
