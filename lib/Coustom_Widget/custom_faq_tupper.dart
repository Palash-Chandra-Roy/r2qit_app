import 'package:flutter/material.dart';

class CustomFaqTupper extends StatelessWidget {
  String text;
  late VoidCallback? goToSupportChatPage;
  IconData? icon;
  CustomFaqTupper(
      {super.key, required this.text, this.goToSupportChatPage, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
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
