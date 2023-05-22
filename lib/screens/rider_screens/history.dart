import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/screens/common_screens/edit_profile_screen.dart';
import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mowasulatuna/screens/rider_screens/info_screen.dart';
import 'package:mowasulatuna/screens/rider_screens/history_details.dart';
import '../../providers/book_provider.dart';
import '../../providers/current_possition.dart';
import 'r_home.dart';
//import 'package:mowasulatuna/screens/driver_screens/my_bus.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProvider>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final proCurrentPosition = Provider.of<CurrentPossition>(context);

    return Scaffold(
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: h * 0.015,
                ),
                height: h * 0.053,
                width: w * 0.38,
                child: Image.asset('assets/images/logoText.png'),
              ),
              SizedBox(
                width: w * .05,
              ),
              Container(
                padding: EdgeInsets.only(right: w * 0.09),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RHome(proCurrentPosition.getkGooglePlex()),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Color(0xffdda006),
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: h * 0.861,
            width: w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HistoryDetails(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 5),
                          padding: const EdgeInsets.only(top: 30, bottom: 30),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/OneOfHistory.png'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: h * 0.43,
                        right: w * 0.15,
                        child: Text(
                          pro.getDetailsDayDate(),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.vazirmatn(
                            color: const Color(0xb2f0f0f0),
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: h * 0.43,
                        right: w * 0.59,
                        child: Text(
                          pro.getDetailsBookTime(),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.vazirmatn(
                            color: const Color(0xb2f0f0f0),
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
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
        ],
      ),
    );
  }
}
