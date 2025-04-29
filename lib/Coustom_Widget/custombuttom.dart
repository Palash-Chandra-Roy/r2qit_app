import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  final VoidCallback onPressed;
  Color color;
  Color textColor;

  CustomButton({
    Key? key,
    required this.buttonText,
    required this.color,
    required this.onPressed,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        minimumSize: const Size(353, 54),
        maximumSize: const Size(353, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
