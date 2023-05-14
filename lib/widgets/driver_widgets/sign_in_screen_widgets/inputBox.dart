import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mowasulatuna/providers/input_box_provider.dart';
import 'package:provider/provider.dart';

class InputBox extends StatelessWidget {
  final String title;
  final TextInputType type;
  final bool isPassword;

  InputBox(this.title, this.type, this.isPassword, {super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<InputBoxProvider>(context);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: w * 0.13),
      height: h * 0.1,
      width: w * 0.75,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black, // Set the color of the border
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: w * 0.75,
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: GoogleFonts.vazirmatn(
                color: Color(0xb2f0f0f0),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              textDirection: TextDirection.rtl,
              style: GoogleFonts.vazirmatn(
                color: Color(0xb2f0f0f0),
                textStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              ),
              decoration: InputDecoration(
                prefixIcon: isPassword
                    ? pro.showPass
                        ? IconButton(
                            onPressed: () {
                              pro.setShowPass();
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              pro.setShowPass();
                            },
                            icon: Icon(
                              Icons.visibility_off,
                            ),
                          )
                    : Text(''),
              ),
              keyboardType: type,
              keyboardAppearance: Brightness.dark,
              obscureText: !pro.showPass && isPassword,
            ),
          ),
        ],
      ),
    );
  }
}
