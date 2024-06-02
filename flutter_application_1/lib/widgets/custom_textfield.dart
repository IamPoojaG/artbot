import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData? icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.labelText = '',
    this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.border = const OutlineInputBorder(),
    this.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    this.enabledBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        icon: icon != null ? Icon(icon) : null,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
      ),
    );
  }
}
