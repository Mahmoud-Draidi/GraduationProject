import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/book_provider_passenger.dart';

class BookBox extends StatelessWidget {
   dynamic value;
  final List<String> choices;

   BookBox(this.value, this.choices, {super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BookProviderPassenger>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.05,
      width: w * 0.65,
      decoration: BoxDecoration(
        color: Color(0xFF353535),
      ),
      child: DropdownButton<String>(
        menuMaxHeight: 150,
        autofocus: true,
        alignment: AlignmentDirectional.center,
        dropdownColor: Color(0xFF353535),
        value: value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? val) {
          value = val;
        },
        items: choices.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: GoogleFonts.vazirmatn(
                color: Color(0xffdda006).withOpacity(0.5),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
