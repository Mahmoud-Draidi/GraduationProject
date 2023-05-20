import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class OneHistory extends StatelessWidget{
  final int numOfTravel;
  final String dayDate;
  final String direction;

  const OneHistory(this.numOfTravel,this.dayDate,this.direction,{super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h*0.1,
      width: w*0.1,
      decoration: BoxDecoration(

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Text(
        "احجز مقعدك",
        textAlign: TextAlign.center,
        style: GoogleFonts.vazirmatn(
          color: Color(0xb2f0f0f0),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
          Row(
            children: [

            ],
          ),
        ],
      ),
    );
  }
}