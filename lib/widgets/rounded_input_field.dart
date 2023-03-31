import 'package:flutter/material.dart';
import 'package:fen_ghadi/constants.dart';
import 'package:fen_ghadi/widgets/widgets.dart';

class RoundedInputField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon ;

  const RoundedInputField({
    super.key,
    required this.icon,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}
