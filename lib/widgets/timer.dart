import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/book_provider_passenger.dart';
import 'package:mowasulatuna/providers/timer_provider.dart';
import 'package:provider/provider.dart';

class MyTimer extends StatelessWidget {
  final int start;

  const MyTimer(this.start, {super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TimerProvider>(context);
    final pro2 = Provider.of<BookProviderPassenger>(context);

    return Container(
      margin: EdgeInsets.only(top: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${pro.start}',
             textAlign: TextAlign.right,
             style: GoogleFonts.vazirmatn(
              color: Colors.black,
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
