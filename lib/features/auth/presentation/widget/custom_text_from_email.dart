import 'package:flutter/material.dart';

class CustomTextFromEmail extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const CustomTextFromEmail({
    super.key,
    required this.controller,
    this.hintText = "Email",
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Email is required";
        } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(value)) {
          return "Please enter a valid email ";
        } else {
          return null;
        }
      },
    );
  }
}
