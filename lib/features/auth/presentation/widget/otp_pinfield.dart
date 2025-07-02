import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const OtpPinField({
    Key? key,
    required this.controller,
    this.onCompleted,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<OtpPinField> createState() => _OtpPinFieldState();
}

class _OtpPinFieldState extends State<OtpPinField> {
  late String currentText;

  @override
  void initState() {
    super.initState();
    currentText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 30,
      ),
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        obscureText: false,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: widget.validator ??
            (v) {
              if (v == null || v.length < 6) {
                return "Enter a 6-digit code";
              } else {
                return null;
              }
            },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        onCompleted: widget.onCompleted,
        onChanged: (value) {
          setState(() {
            currentText = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          return true;
        },
      ),
    );
  }
}
