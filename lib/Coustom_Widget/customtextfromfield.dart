import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autocorrect;
  final ValueChanged<String>? onChanged;
  final String Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? filled;
  final Color? fillColor;
  final bool readOnly;
  final bool autofocus;

  const CustomTextFormField({
    Key? key,
    this.autocorrect = false,
    this.controller,
    this.onChanged,
    this.autofocus = false,
    this.fillColor,
    this.filled,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.readOnly = false,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: autocorrect,
      autofocus: autofocus,
      controller: controller,
      readOnly: readOnly,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon, // Fixed property name
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        filled: filled ?? false,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
