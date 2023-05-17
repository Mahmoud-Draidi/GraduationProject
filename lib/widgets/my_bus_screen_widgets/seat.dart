import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/seat_provider.dart';
import 'package:mowasulatuna/widgets/driver_widgets/easy_screen_widgets/circle_button.dart';
import 'package:provider/provider.dart';

class SeatWidget extends StatelessWidget {
  int typeOfSeat;
  final String name;
  final String location;

  SeatWidget(this.typeOfSeat, this.name, this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SeatProvider>(context);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    if (typeOfSeat == 0) {
      return GestureDetector(
        onTap: () {
          pro.setTypeOfSeat(2);
        },
        child: Container(
          height: h * 0.19,
          width: w * 0.28,
          margin: EdgeInsets.only(top: 15,bottom: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/emptySeat.png'),
            fit: BoxFit.fill,
          )),
        ),
      );
    } else if (typeOfSeat == 1) {
      return GestureDetector(
        onTap: () {
          pro.setTypeOfSeat(2);
        },
        child: Container(
          height: h * 0.2,
          width: w * 0.30,
          margin: EdgeInsets.only(top: 15,bottom: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/bookedSeat.png'),
            fit: BoxFit.fill,
          )),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Center(
                  child: Container(
                    height: w * 0.09,
                    width: w * 0.09,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                      icon: Text(
                        '!',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        pro.setTypeOfSeat(2);
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Center(
                  child: Container(
                    height: w * 0.11,
                    width: w * 0.11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green.withOpacity(0.9),
                          size: 27,
                        ),
                        onPressed: () {
                          pro.setTypeOfSeat(2);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 17,
                top: h * 0.054,
                child: Container(
                  height: h * 0.04,
                  width: w * 0.2,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      name,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.vazirmatn(
                        color: Colors.black,
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.2),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 17,
                top: h * 0.11,
                child: Container(
                  height: h * 0.04,
                  width: w * 0.1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      location,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.vazirmatn(
                        color: Colors.black,
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else{
      return GestureDetector(
        onTap: () {
          pro.setTypeOfSeat(2);
        },
        child: Container(
          height: h * 0.19,
          width: w * 0.315,
          margin: EdgeInsets.only(top: 15,bottom: 15),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ridenSeat.png'),
                fit: BoxFit.fill,
              )),
          child: Stack(
            children: [
              Positioned(
                bottom: h * 0.025,
                left: 0,
                child: Center(
                  child: Container(
                    height: w * 0.11,
                    width: w * 0.11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red.withOpacity(0.9),
                          size: 28,
                        ),
                        onPressed: () {
                          pro.setTypeOfSeat(0);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 17,
                top: h * 0.054,
                child: Container(
                  height: h * 0.04,
                  width: w * 0.2,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      name,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.vazirmatn(
                        color: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
