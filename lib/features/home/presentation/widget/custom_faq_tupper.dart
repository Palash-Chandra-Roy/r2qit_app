import 'package:flutter/material.dart';

class CustomFaqTupper extends StatelessWidget {
  String text;
  late VoidCallback? goToSupportChatPage;
  late VoidCallback? backButton;
  IconData? icon;
  CustomFaqTupper(
      {super.key,
      required this.text,
      this.goToSupportChatPage,
      this.icon,
      this.backButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: backButton,
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          Text(
            "$text",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: goToSupportChatPage,
            child: Icon(
              icon,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
