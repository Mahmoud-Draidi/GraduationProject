import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/controllers_provider.dart';
import 'package:mowasulatuna/screens/common_screens/profile_screen.dart';
import 'package:provider/provider.dart';

import '../../functions/sign_up_screen_functions.dart';
import '../../widgets/inputBox.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class EditProfileScreen extends StatelessWidget {



  String dName;
  String phoneNum;
  String prevEmail;
  String prevPass;
  String prevName;

  EditProfileScreen(this.dName,this.phoneNum,this.prevName,this.prevEmail,this.prevPass,{super.key});


  @override
  Widget build(BuildContext context) {

    final pro = Provider.of<ControllerProvider>(context);

    bool validate() {
      if (SignUpScreenFunctions.validateNameBoolean(pro.controllerName.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(
              SignUpScreenFunctions.validateNameString(pro.controllerName.text)),
        ).show();
      } else if (SignUpScreenFunctions.validateEmailBoolean(
          pro.controllerEmail.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(
              SignUpScreenFunctions.validateEmailString(pro.controllerEmail.text)),
        ).show();
      } else if (SignUpScreenFunctions.validatePassBoolean(
          pro.controllerPass.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(
              SignUpScreenFunctions.validatePassString(pro.controllerPass.text)),
        ).show();
      } else if (SignUpScreenFunctions.validateRepeatePassBoolean(
          pro.controllerPass.text, pro.controllerRepeatPass.text) ==
          false) {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: Text(SignUpScreenFunctions.validateRepeatePassString(
              pro.controllerPass.text, pro.controllerRepeatPass.text)),
        ).show();
      }
      return SignUpScreenFunctions.validateNameBoolean(pro.controllerName.text)
          && SignUpScreenFunctions.validateEmailBoolean(pro.controllerEmail.text)
          && SignUpScreenFunctions.validatePassBoolean(pro.controllerPass.text)
          && SignUpScreenFunctions.validateRepeatePassBoolean(pro.controllerPass.text,pro.controllerRepeatPass.text);
    }
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final currentTime = DateTime.now();
    final hour = currentTime.hour + 3;

    String greeting;

    if (hour < 12) {
      greeting = 'صباح الخير';
    } else if (hour < 18) {
      greeting = 'مساء الخير';
    } else {
      greeting = 'مساء الخير';
    }

    IconData getIconBasedOnTime() {
      if (hour >= 6 && hour < 18) {
        // Daytime, return the daytime icon
        return Icons.wb_sunny;
      } else {
        // Nighttime, return the nighttime icon
        return Icons.nights_stay;
      }
    }

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
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                          icon: const Icon(
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
                        child:Text(
                          dName,
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
                      SizedBox(
                        height: h * 0.015,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: w * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              greeting,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.vazirmatn(
                                color: const Color(0xfff0f0f0),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(getIconBasedOnTime()),
                                onPressed: () {
                                  print(hour);
                                },
                                color: const Color(0xffdda006),
                              ),
                            )
                          ],
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
                      color: const Color(0xff272727),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: h * 0.054,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InputBox(
                              'الاسم الرباعي',
                              TextInputType.text,
                              false,
                              pro.controllerName,
                              // pro.setName(pro.controllerName.text),
                            ),
                            SizedBox(height: h * 0.017),
                            InputBox(
                              ' البريد الالكتروني',
                              TextInputType.emailAddress,
                              false,
                              pro.controllerEmail,
                              // pro.setEmail(pro.controllerEmail.text),
                            ),
                            SizedBox(height: h * 0.017),
                            InputBox(
                              'كلمة المرور',
                              TextInputType.visiblePassword,
                              true,
                              pro.controllerPass,
                              // pro.setPass(pro.controllerPass.text),
                            ),
                            SizedBox(height: h * 0.017),
                            InputBox(
                              'تأكيد كلمة المرور',
                              TextInputType.visiblePassword,
                              true,
                              pro.controllerRepeatPass,
                              // pro.setRepeatPass(pro.controllerRepeatPass.text),
                            ),
                            SizedBox(height: h * 0.109),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: w / 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfileScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: h * 0.086,
                                        color: Colors.black,
                                        child: Center(
                                          child: Text(
                                            "الغاء",
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
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 2,
                                    child: GestureDetector(
                                      onTap: () async{
                                        print(prevName);
                                        print(prevPass);
                                        print(prevEmail);
                                        validate();
                                        if(validate()){
                                          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                                          print(pro.controllerName.text);
                                          FirebaseAuth auth = FirebaseAuth.instance;
                                          await FirebaseFirestore.instance
                                              .collection('passengers').doc(auth.currentUser!.uid)
                                              .update({
                                            'name':  pro.controllerName.text,
                                            'phone' : phoneNum,
                                            'email': pro.controllerEmail.text,
                                            'password':  pro.controllerPass.text,
                                          }).then((_) {
                                            print('User added to Firestore successfully');
                                          }).catchError((error) {
                                            print(
                                                'Error adding user to Firestore: $error');
                                          });


                                          User? user = FirebaseAuth.instance.currentUser;

                                          if (user != null) {
                                            String newEmail = pro.controllerEmail.text;
                                            user.updateEmail(newEmail)
                                                .then((_) {
                                              // Email update successful
                                              print("Email updated successfully");
                                            })
                                                .catchError((error) {
                                              // Handle email update error
                                              print("Failed to update email: $error");
                                            });
                                          }
                                          if (user != null) {
                                            String newPassword = pro.controllerPass.text;
                                            user.updatePassword(newPassword)
                                                .then((_) {
                                              // Password update successful
                                              print("Password updated successfully");
                                            })
                                                .catchError((error) {
                                              // Handle password update error
                                              print("Failed to update password: $error");
                                            });
                                          }


                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                              const ProfileScreen(),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        height: h * 0.086,
                                        color: const Color(0xffdda006),
                                        child: Center(
                                          child: Text(
                                            "حفظ التعديلات",
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
