import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFromPassword extends StatelessWidget {
  final TextEditingController controller;
  final RxBool obscureText;
  final String hintText;
  final bool autoValidate;

  const CustomTextFromPassword({
    super.key,
    required this.controller,
    required this.obscureText,
    this.hintText = "Password",
    this.autoValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller,
        obscureText: obscureText.value,
        keyboardType: TextInputType.visiblePassword,
        autovalidateMode: autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText.value ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              obscureText.value = !obscureText.value;
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password is required";
          } else if (value.length < 6) {
            return "Password must be at least 6 characters long";
          }
          return null;
        },
      ),
    );
  }
}
