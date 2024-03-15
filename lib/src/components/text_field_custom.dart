import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String hintText;

  const TextFieldCustom(
      {super.key,
      required this.obscureText,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
