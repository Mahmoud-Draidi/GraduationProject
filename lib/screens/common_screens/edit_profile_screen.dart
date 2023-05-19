import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/profile_screen.dart';

import '../../widgets/driver_widgets/common_widgets/inputBox.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class EditProfileScreen extends StatelessWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerRepeatPass = TextEditingController();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Text(
                    "أحمد علي",
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
                        controllerName,
                      ),
                      SizedBox(height: h * 0.017),
                      InputBox(
                        ' البريد الالكتروني',
                        TextInputType.emailAddress,
                        false,
                        controllerEmail,
                      ),
                      SizedBox(height: h * 0.017),
                      InputBox(
                        'كلمة المرور',
                        TextInputType.visiblePassword,
                        true,
                        controllerPass,
                      ),
                      SizedBox(height: h * 0.017),
                      InputBox(
                        'تأكيد كلمة المرور',
                        TextInputType.visiblePassword,
                        true,
                        controllerRepeatPass,
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
