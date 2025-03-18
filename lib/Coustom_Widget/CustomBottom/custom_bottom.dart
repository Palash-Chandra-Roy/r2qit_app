import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  String ButtomText;
  Function() onPressed;
  Color color;
  Color textColor;
  CustomButtom(
      {Key? key,
      required this.ButtomText,
      required this.color,
      required this.onPressed,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            overlayColor: Colors.amber,
            minimumSize: Size(353, 54),
            maximumSize: Size(353, 54),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onPressed,
        child: Text(
          ButtomText,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ));
  }
}
