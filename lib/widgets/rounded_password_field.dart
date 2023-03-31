import 'package:flutter/material.dart';
import 'package:fen_ghadi/constants.dart';
import 'package:fen_ghadi/widgets/widgets.dart';

class RoundedPasswordField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const RoundedPasswordField({
    super.key,
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
         decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "Password",
            hintStyle:  TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}