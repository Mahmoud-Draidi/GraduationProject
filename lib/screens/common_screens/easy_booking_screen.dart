import 'package:flutter/material.dart';
import 'package:mowasulatuna/screens/common_screens/map_screen.dart';
import 'package:mowasulatuna/widgets/driver_widgets/easy_screen_widgets/circle_button.dart';

import 'easy_screen.dart';
import 'know_screen.dart';
import 'sign_in_screen.dart';

class EasyBookingScreen extends StatelessWidget {
  const EasyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/easyBookingScreen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text(
                "تخطي",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x7ff0f0f0),
                  fontSize: 22,
                  decoration: TextDecoration.underline,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: h/11,
              child: SizedBox(
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleButton(false, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ),
                      );
                    }),
                    SizedBox(width: w / 50),
                    CircleButton(false, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KnowScreen(),
                        ),
                      );
                    }),
                    SizedBox(width: w / 50),
                    CircleButton(true, () {
                    }),
                    SizedBox(width: w / 50),
                    CircleButton(false, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EasyScreen(),
                        ),
                      );
                    }),
                  ],
                ),
              )
          ),
          Positioned(
            bottom: h/12.5,
            left: w/15,
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KnowScreen(),
                  ),
                );
              },
              child: Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0x7f000000), width: 1, ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(4, 4),
                    ),
                  ],
                  color: const Color(0xff3b3a3a),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Color(0xffdda006),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
