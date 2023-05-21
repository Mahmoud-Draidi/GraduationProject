import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/common_screens/question_details.dart';

class OneOfFAQ extends StatelessWidget {
  final int num;
  final String question;
  final String answer;

  const OneOfFAQ(this.num, this.question,this.answer, {super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionDetailsScreen(num, question, answer),
          ),
        );
      },
      child: Container(
        height: h * 0.12,
        width: w * 0.8,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: h * 0.012, right: 25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'السؤال رقم $num',
              textAlign: TextAlign.center,
              style: GoogleFonts.vazirmatn(
                color: Color(0xffdda006),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: h * 0.015),
            Container(
              height: h*0.05,
              width: w*0.6,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textDirection: TextDirection.rtl,
                  question,
                  maxLines: 1, // Set the maximum number of lines
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.vazirmatn(
                    color: Color(0xb2f0f0f0),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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
