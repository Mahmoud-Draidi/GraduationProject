import 'package:flutter/cupertino.dart';

class CircleButton extends StatelessWidget{
  final bool isOn;
  final Function f;
  const CircleButton(this.isOn,this.f, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        f();
      },
      child: Container(
        width:isOn?25: 20,
        height:isOn?25: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color:isOn? const Color(0xffdda006):const Color(0xfff7eeee),
        ),
      ),
    );
  }
}