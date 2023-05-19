import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTopBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return AppBar(
      flexibleSpace: Container(
        height: h * 0.13,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1a2636).withOpacity(0.8),
              Color(0xff434343).withOpacity(0.8),
            ],
          ),
        ),
      ),
      title: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: h * 0.015,
            ),
            height: h * 0.053,
            width: w * 0.38,
            child: Image.asset('assets/images/logoText.png'),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}