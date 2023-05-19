import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/seat_provider.dart';

class MyBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SeatProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h,
      width: w,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(h * 0.10), // here the desired height
            child: AppBar(
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
            ),
          ),
          body: Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                width: w * 0.98,
                height: h * 0.83,
                padding: EdgeInsets.all(5),
                color: Color(0xff272727),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: w/1000,),
                        Container(
                          height: w*0.28,
                          width: w*0.28,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/steeringIcon.png')
                            )
                          ),
                        ),
                        // SeatWidget(pro.seats[0].seatCase, pro.seats[0].name, pro.seats[0].location),
                        SeatWidget(0, 'aaaa', 'loca'),
                        SizedBox(width: w/1000,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SeatWidget(1, 'aaaa', 'loca'),
                        SeatWidget(1, 'aaaa', 'loca'),
                        SeatWidget(1, 'aaaa', 'loca'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SeatWidget(2, 'aaaa', 'loca'),
                        SeatWidget(2, 'aaaa', 'loca'),
                        SeatWidget(2, 'aaaa', 'loca'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          endDrawer: MyDrawer()
      ),
    );
  }
}
