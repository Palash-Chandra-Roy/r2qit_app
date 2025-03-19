import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  String buttomText;
  Function() onPressed;
  Color color;
  Color textColor;
  CustomButtom(
      {Key? key,
      required this.buttomText,
      required this.color,
      required this.onPressed,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            //overlayColor: Color(0xFFA020F0),
            minimumSize: Size(353, 54),
            maximumSize: Size(353, 54),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onPressed,
        child: Text(
          buttomText,
          style: TextStyle(fontSize: 16, color: textColor),
        ));
  }
}
