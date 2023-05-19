import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mowasulatuna/screens/common_screens/easy_screen.dart';

class LogoScreen extends StatelessWidget{
  const LogoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1400), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EasyScreen(),
        ),
      );
    });
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logoScreenDD.png'),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}