import 'package:flutter/material.dart';

class CustomTextFromNameOrUser extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const CustomTextFromNameOrUser({
    super.key,
    required this.controller,
    this.hintText = "Name or user",
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name or User name ";
        }
        return null;
      },
    );
  }
}
